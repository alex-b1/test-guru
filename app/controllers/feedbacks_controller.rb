class FeedbacksController < ApplicationController
  def show
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      flash[:alert] = t('.success')
      FeedbacksMailer.set_mail(@feedback).deliver_now
      redirect_to tests_path
    else
      flash[:alert] = t('.fail')
      render :show
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :comment)
  end
end
