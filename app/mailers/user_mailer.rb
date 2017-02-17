class UserMailer < ApplicationMailer
  default from: "noreply@jungle.com"
 def welcome_email(order)
    @order = order
    mail(to: @order.email, subject: "Order number #{@order.id}")
  end
end
