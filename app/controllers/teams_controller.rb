class TeamsController < ApplicationController
  before_filter :authorize

  def index
    render json: Team.all
  end

  def new
    @team = @current_user.build_team
  end

  def create
    @team = current_user.build_team(team_params)
    if @team.save
      current_user.save
      redirect_to team_path(@team)
    else
      render :new
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  private

  def team_params
    params.require(:team).permit(:name, :description)
  end
end
