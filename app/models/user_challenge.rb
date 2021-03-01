class UserChallenge < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  belongs_to :challenge
end
