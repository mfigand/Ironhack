class TournamentsController < ApplicationController
  def index
    render(:index)
  end

  def show_list_tournaments
    tournaments = Tournament.all
    render json: tournaments, status: 201
  end

  def create
    tournament = Tournament.create(tournament_params)
    render json: tournament, status: 201
  end

  def delete
    tournament = Tournament.find(params[:id])
    tournament.destroy
    render json: tournament, status: 201
  end

  private

  def tournament_params
    params.require(:tournament).permit(:name)
  end


end
