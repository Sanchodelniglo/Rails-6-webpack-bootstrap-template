class Invitation < ApplicationRecord
  belongs_to :user_challenge

  validates_presence_of :email

  def sender
    user_challenge.user
  end
end
