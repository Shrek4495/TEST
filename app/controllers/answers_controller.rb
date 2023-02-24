class AnswersController < ApplicationController
  before_action :find_question, only: %i[new create]

  private

  def find_question
    @question = Question.find(params[:question_id])
  end
end

