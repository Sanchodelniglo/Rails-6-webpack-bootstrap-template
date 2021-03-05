class AnswersController < ApplicationController
  def compute_score
    user_challenge = UserChallenge.find(params[:user_challenge_id])
    answer = Answer.find(params[:id])
    question = answer.question

    score = blame_or_increment_score(user_challenge: user_challenge, question: question, answer: answer)

    render json: { score: score }
  end

  private

  def increment_score(answer:, user_challenge:)
    if answer.correct
      user_challenge.score += answer.question.score
    else
      user_challenge.score
    end
  end

  def blame_or_increment_score(user_challenge:, question:, answer:)
    uca = UserChallengeQuestion
    if uca.find_by(user_challenge: user_challenge, question: question).present?
      sample_blame
    else
      uca.create!(user_challenge: user_challenge, question: question)
      user_challenge.update!(score: increment_score(answer: answer, user_challenge: user_challenge))
      user_challenge.score
    end
  end

  def sample_blame
    [
      "Comment t'es en train de tricher !!",
      "T'as pas honte ?",
      "On t'as vu !",
      "Pas bien !",
      "Tu te couvres de honte !"
    ].sample
  end
end