class UserChallenge < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant, optional: true
  belongs_to :challenge
  has_many :invitations
  has_many :user_challenge_answers

  accepts_nested_attributes_for :invitations
end
