class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :challenge_questions
  has_many :challenges, through: :challenge_questions

  validates_presence_of :prompt

  scope :pick_randomly, ->(number) { order(Arel.sql('RANDOM()')).take(number) }

  def score
    answers.size
  end
end
