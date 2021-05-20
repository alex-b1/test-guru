class FeedbacksMailer < ApplicationMailer
  def set_mail(feedback)
    @feedback = feedback
    mail to: User.find_by(type: 'Admin').email
  end
end