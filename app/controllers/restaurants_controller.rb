class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def index
    challenge = Challenge.find(params[:challenge_id])
    client = GooglePlaces::Client.new('AIzaSyAKVQETXVt0StkwujEpdLezCnZdmPrXULo')
    @restaurants = client.spots(challenge.to_coordinates.first, challenge.to_coordinates.last, types: %w[restaurant food], detail: true, radius: 200)
  end
end