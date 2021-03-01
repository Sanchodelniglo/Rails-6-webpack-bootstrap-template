class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def index
    challenge = Challenge.find(params[:challenge_id])
    retriever = GooglePlacesApi::Retriever.build
    result = retriever.get_restaurants_around(coordinates: challenge.to_coordinates, radius: params[:radius_for_restaurants])

    if result.nil?
      flash[:alert] = "Impossible de géolocaliser l'addresse donnée"
      redirect_to new_challenge_path
    else
      @restaurants = result
    end
  end
end