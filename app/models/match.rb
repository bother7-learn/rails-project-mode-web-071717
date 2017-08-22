class Match < ApplicationRecord
# validates :hometeam, :awayteam, presence: true
before_save :simulate
# home team
# away team

# possessions can end with turnover, foul, or shot
# possession increases the timer
# when timer is > 90, game is over
  def simulate
    @timer = 0.00
    halftime = 0
    eventlog = {}
    base = ["turnover", "foul", "shot"]
    probability = [0.60, 0.15, 0.25]
    outcome_generator = AliasTable.new(base, probability)
    while @timer < 90.00
      possession(@timer, eventlog, outcome_generator)
    end
    eventlog
  end

  def possession(clock, gamelog, generator)
    clock += rand(1.0..3.0).round(2)
    gamelog[clock] = generator.generate
  end


end
