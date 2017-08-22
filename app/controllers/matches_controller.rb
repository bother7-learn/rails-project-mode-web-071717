class MatchesController < ApplicationController

  def new
    @match = Match.new
    @teams = Team.all
    @user_teams = UserTeam.all
  end

  def create
    @match = Match.new
    # params[:hometeam_id] params[:awayteam_id]
    # home = Team.find(params[:hometeam_id]) or UserTeam.find(params[:hometeam_id])
    # away = Team.find(params[:awayteam_id]) or UserTeam.find(params[:awayteam_id])
    @match.hometeam = home
    @match.awayteam = away
    @match.simulate
    @match.save
  end
end
