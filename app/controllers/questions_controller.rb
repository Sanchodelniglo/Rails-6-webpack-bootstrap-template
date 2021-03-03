class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    challenge = Challenge.find(params[:challenge_id])
    @questions = challenge.questions
  end
end