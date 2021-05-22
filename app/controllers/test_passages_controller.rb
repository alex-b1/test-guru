class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passeage, only: %i[show update result gist]
  before_action :set_user_badges

  def show; end

  def result; end

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
