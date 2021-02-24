class Answer < ApplicationRecord
  belongs_to :question

  validates_presence_of :assertion
  validates :correct, inclusion: { in: [true, false] }
end
