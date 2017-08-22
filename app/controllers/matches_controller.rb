class MatchesController < ApplicationController

  def new
    @match = Match.new
    @teams = Team.all
    @user_teams = UserTeam.all
  end

  def create

    @match = Match.new
    if params[:home_user_team_id] == ""
      home = Team.find(params[:home_team_id])
    else
      home = UserTeam.find(params[:home_user_team_id])
    end

    if params[:away_user_team_id] == ""
      away = Team.find(params[:away_team_id])
    else
      away = UserTeam.find(params[:away_user_team_id])
    end
   # home = Team.find(params[:home_team_id]) or UserTeam.find(params[:home_user_team_id])
   # away = Team.find(params[:away_team_id]) or UserTeam.find(params[:away_user_team_id])
   @match.hometeam = home
   @match.awayteam = away

   @match.simulate
   @match.save
  end
end
