class ApplicationMailer < ActionMailer::Base
  default from: "noreply@jungle.com"
  layout 'mailer'

  def welcome_email(user)
    @order = order
    mail(to: @order.email, subject: 'Order number #{@order.id}')
  end

end
