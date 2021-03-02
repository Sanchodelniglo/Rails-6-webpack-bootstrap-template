class UserChallenge < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant, optional: true
  belongs_to :challenge
  has_many :invitations

  accepts_nested_attributes_for :invitations
end
