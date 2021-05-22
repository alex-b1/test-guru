class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passeage, only: %i[show update result gist time time_up last_time]
  before_action :set_user_badges
  skip_before_action  :verify_authenticity_token, only: %i[time_up last_time]

  def show; end

  def result; end

  def time
    execution_time = @test_passage.test.execution_time
    last_time = @test_passage.last_time

    render json: {time: execution_time, last_time: last_time}
  end

  def time_up
    TestsMailer.completed_test(@test_passage).deliver_now
    admin = Admin.first
    admin.rules(current_user, @test_passage.test_id)

    render json: {result: result_test_passage_path(@test_passage)}
  end

  def last_time
    @test_passage.last_time = params[:last_time]
    @test_passage.save
    render json: {time: execution_time, last_time: last_time}
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      admin = Admin.first
      admin.rules(current_user, @test_passage.test_id)

      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)
    gist = result.call

    if result.success?
      current_user.gists.create(question: @test_passage.current_question, url: gist.html_url)
      flash[:notice] = "#{t('.success')} #{helpers.link_to(t('.github'), gist.html_url, target: "_blank")}"
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  private

  def set_test_passeage
    @test_passage = TestPassage.find(params[:id])
  end
end
