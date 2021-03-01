require 'rails_helper'

RSpec.describe UserChallenge, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:restaurant) }
    it { should belong_to(:challenge) }
  end
end
