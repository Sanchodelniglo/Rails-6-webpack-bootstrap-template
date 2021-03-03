class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :challenge_questions
  has_many :challenges, through: :challenge_questions

  validates_presence_of :prompt
end
