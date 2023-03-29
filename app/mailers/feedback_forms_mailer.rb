class FeedbackFormsMailer < ApplicationMailer
  def send_to_admin(feedback)
    @user_email = feedback.email
    @text = feedback.text
    admin = User.find_by type: 'Admin'
    mail to: admin.email if admin.present?
  end
end