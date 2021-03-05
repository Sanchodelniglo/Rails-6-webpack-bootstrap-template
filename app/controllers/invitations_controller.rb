class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @challenge = Challenge.find(params[:challenge_id])
    @user_challenge = UserChallenge.find(params[:id])
  end
end
