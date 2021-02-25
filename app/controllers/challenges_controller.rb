class ChallengesController < ApplicationController
  before_action :authenticate_user!

  def new
    @challenge = current_user.challenges.build
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.save!
  end

  private

  def challenge_params
    params.require(:challenge).permit(:question_number, :address)
  end
end
