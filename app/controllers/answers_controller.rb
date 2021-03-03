class AnswersController < ApplicationController
  def show
    answer = Answer.find(params[:id])
    score = answer.correct ? answer.question.answers.count : 0

    render json: { data: score }
  end
end