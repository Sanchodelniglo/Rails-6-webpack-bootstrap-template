class ChallengesController < ApplicationController
  before_action :authenticate_user!

  def show
    @challenge = Challenge.find(params[:id])
    @user_challenge = UserChallenge.find_by(user: current_user, challenge: @challenge)
    @ranking = Ranking.new(challenge: @challenge, user: current_user)
  end

  def new
    @challenge = current_user.challenges.build
  end

  def create
    challenge = Challenge.new(challenge_params)
    if challenge.save!
      challenge.questions << Question.pick_randomly(challenge.question_number)
      redirect_to challenge_restaurants_path(challenge)
    else
      render :new
    end
  end

  private

  def challenge_params
    params.require(:challenge).permit(:question_number, :address, :search_radius)
  end
end
