class OrderConfirmationMailer < ActionMailer::Base
  default from: "EarPuff <mailman@earpuff.com>"

  def email(user, description, amount)
  	@user = user
  	@description = description
  	@amount = amount
    mail(:to => @user.email, :subject => "EarPuff Order Confirmation")
  end
end
