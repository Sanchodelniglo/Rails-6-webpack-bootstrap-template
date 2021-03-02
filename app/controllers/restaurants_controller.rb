class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def index
    @challenge = Challenge.find(params[:challenge_id])
    retriever = GooglePlacesApi::Retriever.build
    restaurants = retriever.build_restaurants(coordinates: @challenge.to_coordinates, radius: @challenge.search_radius)

    if restaurants.empty?
      flash[:alert] = '0 restaurants trouvés, Il va falloir élargir le rayon de recherche !'
      redirect_to new_challenge_path
    else
      @restaurants = restaurants
    end
  end

  def create
    challenge_id = params[:challenge_id]
    restaurant = Restaurant.new(restaurant_params)
    if restaurant.save!
      user_challenge = UserChallenge.create!(user: current_user, challenge_id: challenge_id, restaurant: restaurant)
      destination = new_challenge_invitation_path(challenge_id, id: user_challenge)
    else
      flash[:alert] = "Un problème s'est produit, veuillez réessayer !"
      destination = challenge_restaurants_path
    end

    redirect_to destination
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:address, :name, :cost, :open, :place_id, :rating)
  end
end