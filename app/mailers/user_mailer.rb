class UserMailer < ApplicationMailer
 default from: 'no-reply@jungle.com'

  def order_receipt(user, order)
    @user = user
    @url  = 'http://example.com/login'
    @order = order
    mail(to: @user.email, subject: "Your order: #{order.id} is confirmed")
  end

end
