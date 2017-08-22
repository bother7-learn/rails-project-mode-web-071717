class MatchesController < ApplicationController

  def new
    @match = Match.new
    @teams = Team.all
    @user_teams = UserTeam.all
  end

  def create
    @match = Match.new
  end
end
