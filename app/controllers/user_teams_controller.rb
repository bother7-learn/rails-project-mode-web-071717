class UserTeamsController < ApplicationController

  def new
    @user_team = UserTeam.new

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

end
