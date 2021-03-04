module Getters
  class Invitations
    def self.for(user:, challenge:)
      user_challenge = UserChallenge.find_by(user: user, challenge: challenge)
      user_challenge.invitations
    end
  end
end