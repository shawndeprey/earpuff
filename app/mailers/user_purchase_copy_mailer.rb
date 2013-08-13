class UserPurchaseCopyMailer < ActionMailer::Base
  default from: "EarPuff <mailman@earpuff.com>"
  
  def email(user, description, amount)
  	@user = user
  	@description = description
  	@amount = amount
    mail(:to => ApplicationHelper::COPY_EMAIL, :subject => "New EarPuff User")
  end
end
