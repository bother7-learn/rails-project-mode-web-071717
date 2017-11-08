class UserTeam < ApplicationRecord
  has_many :player_user_teams
  has_many :players, through: :player_user_teams
  belongs_to :user, optional: true
  validates :name, presence:true, uniqueness: true
  validate :unique?
  validate :totalsalary

  def unique?
  self.errors[:players] << "need to be unique" if  self.players != self.players.uniq
  end

  def matches
  Match.where("hometeam_id = ? OR awayteam_id = ?", self.id, self.id)
  end

  def salary
    sum = 0
    players.each do |player|
      sum += player.contract
    end
    sum
  end

  def totalsalary
    self.errors[:salary] << " is Over Team Budget by #{self.salary - 155}" unless (self.salary <= 155 || self.user_id == nil)
  end

  def win_loss_record
    homegames = self.matches.select {|match| match.hometeam_id == self.id}
    awaygames = self.matches.select {|match| match.awayteam_id == self.id}
    awayrecord = []
    homerecord = []
    string = ""
    homerecord = homegames.map do |game|
      if (game.home_goals > game.away_goals)
        "win"
      elsif (game.home_goals < game.away_goals)
        "loss"
      else
        "tie"
      end
    end
    awayrecord = awaygames.map do |game|
      if (game.away_goals > game.home_goals)
        "win"
      elsif (game.away_goals < game.home_goals)
        "loss"
      else
        "tie"
      end
    end
    totalrecord = homerecord + awayrecord

    wins = totalrecord.select {|result| result == "win"}
    self.wins = wins.size
    losses = totalrecord.select {|result| result == "loss"}
    self.losses = losses.size
    ties = totalrecord.select {|result| result == "tie"}
    self.ties = ties.size
    self.save
    string = "#{wins.size} Wins - #{losses.size} Losses - #{ties.size} Ties"
  end


end
