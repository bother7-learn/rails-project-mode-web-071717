class MatchesController < ApplicationController

  def new
    @match = Match.new
    @teams = Team.all
    @user_teams = UserTeam.all
  end

  def create

    @match = Match.new
    home = UserTeam.find(params[:home_user_team_id])
    away = UserTeam.find(params[:away_user_team_id])

   # home = Team.find(params[:home_team_id]) or UserTeam.find(params[:home_user_team_id])
   # away = Team.find(params[:away_team_id]) or UserTeam.find(params[:away_user_team_id])
   @match.hometeam = home
   @match.awayteam = away
   if @match.valid?
     @match.simulate
     @match.save
     redirect_to match_path(@match)
   else
     if @match.errors.messages[:hometeam]
       flash[:message] = @match.errors.full_messages
    else
      flash[:message] = @match.errors.full_messages
     end
     redirect_to new_match_path
   end
  end

  def show
    @match = Match.find(params[:id])
  end


end
