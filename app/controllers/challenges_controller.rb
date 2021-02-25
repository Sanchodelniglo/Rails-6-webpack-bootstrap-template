class ChallengesController < ApplicationController
  before_action :authenticate_user!

  def new
    @challenge = current_user.challenges.build
  end
end
