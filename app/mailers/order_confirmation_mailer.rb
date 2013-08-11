class OrderConfirmationMailer < ActionMailer::Base
  default from: "EarPuff <mailman@earpuff.com>"

  def email(user, amount, price)
  	@user = user
  	@amount = amount
  	@price = price
    mail(:to => @user.email, :subject => "EarPuff Order Confirmation")
  end
end
