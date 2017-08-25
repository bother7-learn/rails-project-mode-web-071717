class Player < ApplicationRecord
  belongs_to :team, optional: true
  has_many :player_user_teams
  belongs_to :user, optional: true
  has_many :user_teams, through: :player_user_teams
  delegate :league, to: :team, allow_nil: true
  validates :name, length: {maximum: 20}, presence: true
  validates :shooting,:passing,:defense,:foul,:dribbling, :position, presence: true
  validate :goalkeeper

  def goalkeeper
    if self.position == "goalie"
    self.errors[:goalie] << " Shooting and Dribbling <= 40" unless (self.shooting <= 40 && self.dribbling <= 40)
    end
  end

  def goals(userteam)
    logs = userteam.matches.map do |match|
      eval(match.final_log)
    end
    count = 0
    goals = logs.each do |log|
      check = log.each do |key, value|
        if value != "HALFTIME" && value[:action] == "GOAL" && value[:possession] == userteam.name && value[:scored_by] == self.name
          count += 1
        end
      end
    end
    count
  end

  def assists(userteam)
    logs = userteam.matches.map do |match|
      eval(match.final_log)
    end
    count = 0
    goals = logs.each do |log|
      check = log.each do |key, value|
        if value != "HALFTIME" && value[:action] == "GOAL" && value[:possession] == userteam.name && value[:assist_by] == self.name
          count += 1
        end
      end
    end
    count
  end

  def shots(userteam)
    logs = userteam.matches.map do |match|
      eval(match.final_log)
    end
    count = 0
    goals = logs.each do |log|
      check = log.each do |key, value|
      if value != "HALFTIME" && value[:action] == "Missed Shot" && value[:possession] == userteam.name && value[:shot_by] == self.name
        count += 1
      elsif value != "HALFTIME" && value[:action] == "GOAL" && value[:possession] == userteam.name && value[:scored_by] == self.name
          count += 1
        end
      end
    end
    count
  end

  def salary
    if self.position != "goalie"
      sum = self.shooting ** 2 + self.passing ** 2 + self.defense ** 2 + self.dribbling ** 2 - self.foul
      if self.user_id == nil && sum > 29000
        sum = 29000
      end
    else
      sum = (self.defense ** 2) * 2
    end
    self.contract = (sum * 0.000689).to_i
  end

end
