class OrderMailer < ApplicationMailer
  default from: "no-reply@jungle.com"
  
  def order_email(email, order_id)
    mail(to: email, subject: "Thanks from Jungle! Order #: ".concat(order_id))
  end
end
