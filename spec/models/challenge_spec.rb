require 'rails_helper'

RSpec.describe Challenge, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:question_number) }
    it { should validate_numericality_of(:question_number) }
    it { should validate_presence_of(:address) }
    it { should validate_numericality_of(:search_radius) }
  end

  describe 'associations' do
    it { should have_many(:user_challenges) }
    it { should have_many(:restaurants) }
    it { should have_many(:invitations) }
    it { should have_many(:users) }
  end
end
