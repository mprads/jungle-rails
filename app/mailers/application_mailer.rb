class ApplicationMailer < ActionMailer::Base
  default from: "noreply@jungle.com"
  layout 'mailer'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

end
