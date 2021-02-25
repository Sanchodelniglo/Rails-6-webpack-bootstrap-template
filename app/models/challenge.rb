class Challenge < ApplicationRecord
  has_many :user_challenges
  has_many :users, through: :user_challenges

  validates_presence_of :question_number
  validates_numericality_of :question_number
  validates_presence_of :address
end
