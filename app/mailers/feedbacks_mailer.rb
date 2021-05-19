class FeedbacksMailer < ApplicationMailer
  before_action :find_admin

  def set_mail(feedback)
    @feedback = feedback
    mail to: @admin.email
  end

  def find_admin
    @admin = User.find_by(type: 'Admin')
  end
end