class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passeage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    passed_time = @test_passage.passed_time(@test_passage)

    if @test_passage.completed? || passed_time < 0
      TestsMailer.completed_test(@test_passage).deliver_now

      if @test_passage.success?
        @test_passage.update(result: true)
        BadgeService.new(current_user, @test_passage).call
      end

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
