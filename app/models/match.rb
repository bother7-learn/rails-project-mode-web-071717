class Match < ApplicationRecord
validates :hometeam, :awayteam, presence: true
# before_save :simulate
attr_accessor :hometeam, :awayteam, :final_log
# home team
# away team

# possessions can end with turnover, foul, or shot
# possession increases the timer
# when timer is > 90, game is over
  def simulate
    @timer = 0.00
    halftime = 0
    eventlog = {}
    base = ["shot", "turnover", "foul"]

    homeprob = prob(@hometeam, @awayteam)
    awayprob = prob(@awayteam, @hometeam)
    home_generator = AliasTable.new(base, homeprob)
    away_generator = AliasTable.new(base, awayprob)
    halftime = 0
    @team_with_ball = false
    while @timer < 90.00
      if @team_with_ball == false
        x = possession(@timer, eventlog, home_generator, @team_with_ball)
      else
        x = possession(@timer, eventlog, away_generator, @team_with_ball)
      end
      @timer = x
      @team_with_ball ^= true
      if @timer > 45.00 && halftime == 0
        @timer = 45.00
        halftime = 1
        eventlog[@timer] = "HALFTIME"
      end
    end
    @final_log = eventlog
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
    @awayteam.name
    else
    @hometeam.name
    end
  end

  def foul_chance
    base = ["foul", "yellow card", "red card"]
    probability = [70r/100, 25r/100, 5r/100]
    foul = AliasTable.new(base, probability)
    foul.generate
  end

  def defense_rating(team)
    total = 0
    team.players.each do |player|
      total += player.defense ** 2 * 3
    end
    total
  end

  def offense_rating(team)
    total = 0
    team.players.each do |player|
      total += player.passing ** 2
    end
    total
  end

  def foul_rating(team)
    total = 0
    team.players.each do |player|
      total += player.foul ** 2
    end
    total
  end
  # foul = 0.2.rationalize
  # defense = 0.6.rationalize
  # offense = 0.2.rationalize
  def prob(main_team, opposing_team)
    offense = offense_rating(main_team).to_f
    defense = defense_rating(opposing_team).to_f
    foul = 3 * foul_rating(main_team).to_f
    total = offense + defense
    [(offense/total).rationalize, ((defense. - foul)/total).rationalize, (foul/total).rationalize]
  end

  def result
    if @final_log
      @final_log.each do |key, value|
        byebug
      end
    else
      "game has not been simulated yet"
    end
  end
end
