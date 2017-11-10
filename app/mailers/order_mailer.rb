class OrderMailer < ApplicationMailer
  default from: "no-reply@jungle.com"
  
  def order_email(order)
    @order = order
    mail(to: @order.email, subject: "Jungle - Receipt for order #".concat(@order.id.to_s))
  end
end
