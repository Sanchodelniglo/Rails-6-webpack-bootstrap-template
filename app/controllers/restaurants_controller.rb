class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def index
    challenge = Challenge.find(params[:challenge_id])
    retriever = GooglePlacesApi::Retriever.build
    result = retriever.get_restaurants_around(challenge.to_coordinates)

    if result.nil?
      flash[:alert] = "Impossible de géolocaliser l'addresse donnée"
      redirect_to new_challenge_path
    else
      @restaurants = result
    end
  end
end