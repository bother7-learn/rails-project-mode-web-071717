class UserTeam < ApplicationRecord
  has_many :player_user_teams
  has_many :players, through: :player_user_teams
  belongs_to :user, optional: true
  # has_many :matches, foreign_key: "hometeam_id" || foreign_key: "awayteam_id"
  # validates :player_id, unqueness: true

  def matches
  Match.where("hometeam_id = ? OR awayteam_id = ?", self.id, self.id)
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
    losses = totalrecord.select {|result| result == "loss"}
    ties = totalrecord.select {|result| result == "tie"}
    string = "#{wins.size} Wins - #{losses.size} Losses - #{ties.size} Ties"
  end


end
