class UserTeamsController < ApplicationController

  def new
    if session[:user_id]
    @user_team = UserTeam.new
      @players = Player.all
    render :new
  else
    redirect_to login_path
  end
  end

  def index
    @user_teams = UserTeam.all
  end

  def show
    @user_team = UserTeam.find(params[:id])
  end

  def create
    @user_team = UserTeam.new(name: params[:name])
    @user_team.user_id = session[:user_id]
    params[:player_ids].each do |p|
    @user_team.players << Player.find(p)
    end
    if @user_team.valid?
      @user_team.save
      redirect_to user_team_path(@user_team)
    else
      render :new
    end
  end

  def show
    @user_team = UserTeam.find(params[:id])
  end

  private



  def userteam_params
    params.require(:user_team).permit(:name)
  end

end
