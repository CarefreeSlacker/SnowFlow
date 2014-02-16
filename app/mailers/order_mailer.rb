class OrderMailer < ActionMailer::Base
  default from: "raggamer101@yandex.ru"

  def order_formed(order)
    @order = order
    @cart = order.cart
    @user = @cart.user
    mail(to: @user.email, subject: 'Snowflow. Your order has successfully formed')
  end
end
