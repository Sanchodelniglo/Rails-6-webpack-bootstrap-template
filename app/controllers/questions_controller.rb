class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    challenge = Challenge.find(params[:challenge_id])
    @user_challenge = UserChallenge.find_by(user: current_user, challenge: challenge)
    @user_challenge.update!(score: 0)
    @questions = challenge.questions
  end
end