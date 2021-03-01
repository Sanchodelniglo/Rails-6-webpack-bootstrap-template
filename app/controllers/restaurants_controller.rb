class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def index
    @challenge = Challenge.find(params[:challenge_id])
    retriever = GooglePlacesApi::Retriever.build
    restaurants = retriever.build_restaurants(coordinates: @challenge.to_coordinates, radius: params[:radius_for_restaurants])

    if restaurants.empty?
      flash[:alert] = "Impossible de géolocaliser l'addresse donnée"
      redirect_to new_challenge_path
    else
      @restaurants = restaurants
    end
  end

  def create
    restaurant = Restaurant.new(restaurant_params)
    if restaurant.save!
      UserChallenge.create!(challenge_id: params[:challenge_id], user: current_user, restaurant: restaurant)
    else
      flash[:alert] = "Un problème s'est produit, veuillez réessayer !"
      destination = challenge_restaurants_path
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:address, :name, :cost, :open, :place_id, :rating)
  end
end