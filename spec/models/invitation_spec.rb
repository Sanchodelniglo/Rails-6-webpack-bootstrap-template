require 'rails_helper'

RSpec.describe Invitation, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
  end

  describe 'associations' do
    it { should belong_to(:user_challenge) }
  end
end
