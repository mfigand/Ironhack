class PlayersController < ApplicationController
  def create
    tournament = Tournament.find(params[:id])
    p = tournament.players.create()
    render json: tournament, status: 201
  end

  private

  def tournament_params
    params.require(:tournament).permit(:name)
  end
end
