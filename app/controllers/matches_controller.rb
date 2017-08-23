class MatchesController < ApplicationController

  def new
    if session[:user_id]
    @match = Match.new
    @teams = Team.all
    @user_teams = UserTeam.all
    render :new
  else
    redirect_to signin_path
  end

  def create

    @match = Match.new
    home = UserTeam.find(params[:home_user_team_id])
    away = UserTeam.find(params[:away_user_team_id])

   # home = Team.find(params[:home_team_id]) or UserTeam.find(params[:home_user_team_id])
   # away = Team.find(params[:away_team_id]) or UserTeam.find(params[:away_user_team_id])
   @match.hometeam = home
   @match.awayteam = away

   @match.simulate
   @match.save
   redirect_to match_path(@match)
  end

  def show
    @match = Match.find(params[:id])
  end


end
