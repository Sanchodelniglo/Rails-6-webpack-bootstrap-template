class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def index
    challenge = Challenge.find(params[:challenge_id])
    retriever = GooglePlacesApi::Retriever.build
    @restaurants = retriever.get_restaurants_around(challenge.to_coordinates)
  end
end