class TeamsController < ApplicationController

  def index
    if params[:search]
      arr = []
      Team.all.each do |t|
        if t.name == params[:search]
          arr << t
          end
        @teams = arr
        end
      else
      @teams = Team.all
    end
  end


  def show
    @team = Team.find(params[:id])
  end
end
