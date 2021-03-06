class UserTeamsController < ApplicationController

  def new
  if !!session[:user_id]
    @user_team = UserTeam.new
      @players = Player.all
  else
    flash[:alert] = "User Must be Logged in To Create Team"
    redirect_to home_path
  end
  end

  def leaderboard
  user_teams = UserTeam.all
  user_teams.each do |team|
    team.win_loss_record
  end
  @user_teams = user_teams.order(wins: :desc)
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
    if p != ""
    @user_team.players << Player.find(p.to_i)
    end
    end
    @user_team.valid?
    if @user_team.valid? && params[:usersubmit] == "0"
      @user_team.save
      redirect_to user_team_path(@user_team)
    else
      flash[:message] = @user_team.errors.full_messages
      @players = Player.all
      render "new"
    end
  end

  def edit
    @user_team = UserTeam.find(params[:id])
    @players = Player.all
  end

  def update
    @user_team = UserTeam.find(params[:id])
    if @user_team.user_id == session[:user_id]
      @user_team.name = params[:name]
      @user_team.players = []
      params[:player_ids].each do |p|
        if p != ""
        @user_team.players << Player.find(p.to_i)
        end
      end
    end
    if @user_team.valid? && params[:usersubmit] == "0"
      @user_team.save
      redirect_to user_team_path(@user_team)
    else
      flash[:message] = @user_team.errors.full_messages
      redirect_to edit_user_team_path(@user_team)
    end
  end

  def destroy
    @user_team= UserTeam.find(params[:id])
    @user_team.destroy
    redirect_to user_teams_path
  end

  private



  def userteam_params
    params.require(:user_team).permit(:name)
  end

end
