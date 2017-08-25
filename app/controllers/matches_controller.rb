class MatchesController < ApplicationController

  def new
    if !session[:user_id]
      flash[:alert] = "Must Be Logged In to Simulate Match"
      redirect_to home_path
    else
    @match = Match.new
    @teams = Team.all
    @user_teams = UserTeam.all
  end
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
      flash[:message] = @match.errors.full_messages
     redirect_to new_match_path
   end
  end

  def show
    @match = Match.find(params[:id])
    arr = ["forward", "midfielder", "defender", "goalie"]
    hometeam = @match.hometeam.players
    @hometeam = hometeam.sort_by {|p| arr.index(p.position)}
    awayteam = @match.awayteam.players
    @awayteam = awayteam.sort_by {|p| arr.index(p.position)}
  end


end
