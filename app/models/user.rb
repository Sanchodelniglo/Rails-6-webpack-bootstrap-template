class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_challenges
  has_many :challenges, through: :user_challenges
  has_many :invitations, through: :user_challenges

  validates_presence_of :first_name, :last_name, :pseudo
  validates_uniqueness_of :pseudo

  def full_name
    "#{first_name} #{last_name}"
  end
end
