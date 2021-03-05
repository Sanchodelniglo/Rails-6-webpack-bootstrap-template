class UserChallengeQuestion < ApplicationRecord
  belongs_to :user_challenge
  belongs_to :question
end
