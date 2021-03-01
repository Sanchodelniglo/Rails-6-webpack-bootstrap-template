require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:place_id) }
    it { should validate_numericality_of(:rating) }
    it { should validate_numericality_of(:cost) }
  end
end
