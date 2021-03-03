class Challenge < ApplicationRecord
  has_many :user_challenges
  has_many :users, through: :user_challenges
  has_many :restaurants, through: :user_challenges
  has_many :invitations, through: :user_challenges
  has_many :challenge_questions
  has_many :questions, through: :challenge_questions

  validates_presence_of :question_number
  validates_numericality_of :question_number
  validates_presence_of :address
  validates_numericality_of :search_radius

  geocoded_by :address
  after_validation :geocode

  accepts_nested_attributes_for :invitations

  attr_accessor :radius_for_restaurants
end
