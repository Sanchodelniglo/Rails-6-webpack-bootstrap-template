class AnswersController < ApplicationController
  def compute_score
    user_challenge = UserChallenge.find(params[:user_challenge_id])
    answer = Answer.find(params[:id])
    score = increment_score(answer: answer, user_challenge: user_challenge)
    user_challenge.update!(score: score)

    render json: { data: user_challenge.score }
  end

  private

  def increment_score(answer:, user_challenge:)
    if answer.correct
      user_challenge.score += answer.question.score
    else
      user_challenge.score
    end
  end
end