module Getters
  class Restaurant
    def self.for(user:, challenge:)
      user_challenge = UserChallenge.find_by(user: user, challenge: challenge)
      user_challenge.restaurant
    end
  end
end
