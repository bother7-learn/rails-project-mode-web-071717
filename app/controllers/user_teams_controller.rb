class UserTeamsController < ApplicationController

  def new
    @user_team = UserTeam.new
    @players = Player.all
  end

  def show
    @user_team = UserTeam.find(params[:id])
  end

  def create
    byebug
    @user_team = UserTeam.new(userteam_params)
    if @user_team.valid?
      @user_team.save
      redirect_to user_team_path(@user_team)
    else
      render :new
    end
  end

  private

  def userteam_params
    params.require(:user_team).permit(:name)
  end

end
