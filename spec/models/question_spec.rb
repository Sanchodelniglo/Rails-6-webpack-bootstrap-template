require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:prompt) }
  end

  describe 'associations' do
    it { should have_many(:answers) }
  end
end
