class QuestionsController < ApplicationController
  before_action :find_test, only: %i[new, create]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Question.where(test_id: params[:test_id])
    render plain: @questions.inspect
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    render plain: @question.inspect
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to test_questions_path
    else
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
