class AddRestaurantIdToUserChallenge < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_challenges, :restaurant, foreign_key: true
  end
end
