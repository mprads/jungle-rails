class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.welcome_email(Order.last)
  end
end