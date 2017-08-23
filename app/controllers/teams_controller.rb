class TeamsController < ApplicationController

  def index
    if params[:search]
      arr = []
      Team.all.each do |t|
        if t.name.downcase.include?(params[:search].downcase)
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
