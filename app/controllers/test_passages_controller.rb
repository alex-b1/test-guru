class TestPassagesController < ApplicationController

  before_action :set_test_passeage, only: %i[show update result]

  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passeage
    @test_passage = TestPassage.find(params[:id])
  end
end