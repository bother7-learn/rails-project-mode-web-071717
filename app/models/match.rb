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
    base = ["shot", "foul", "turnover"]
    foul = 20r/100
    defense = 60r/100
    offense = 20r/100
    probability = [offense, foul, defense]
    outcome_generator = AliasTable.new(base, probability)
    halftime = 0
    @team_with_ball = false
    while @timer < 90.00
      x = possession(@timer, eventlog, outcome_generator, @team_with_ball)
      @timer = x
      @team_with_ball ^= true
      if @timer > 45.00 && halftime == 0
        @timer = 45.00
        halftime = 1
        eventlog[@timer] = "HALFTIME"
      end
    end
    eventlog
  end

  def possession(clock, gamelog, generator, team)
    clock += rand(1.0..3.0).round(2)
    result = generator.generate
    if result == "shot"
      result = shooting_chance
    end
    if result == "foul"
      result = foul_chance
      gamelog[clock.round(2)] = {action: result, possession: ball(team), card: "player"}
    else
    gamelog[clock.round(2)] = {action: result, possession: ball(team)}
    end
    clock
  end

  def shooting_chance
    base = ["GOAL", "Missed Shot"]
    probability = [30r/100, 70r/100]
    shot = AliasTable.new(base, probability)
    shot.generate
  end

  def ball(theteam)
    if theteam == true
    "awayteam"
    else
    "hometeam"
    end
  end

  def foul_chance
    base = ["foul", "yellow card", "red card"]
    probability = [70r/100, 25r/100, 5r/100]
    foul = AliasTable.new(base, probability)
    foul.generate
  end

  
end
