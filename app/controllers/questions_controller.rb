class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    render 'index'
  end

  def show
    @question = Question.includes(:comments, answers: [:comments]).find(params[:id])
    @answer = Answer.new
  end

  private 

  def question_params
  	params.require(:question).permit(:title, :content, :user_id)
  end
end
