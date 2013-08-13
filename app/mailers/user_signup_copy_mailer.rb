class UserSignupCopyMailer < ActionMailer::Base
  default from: "EarPuff <mailman@earpuff.com>"

  def email(user)
  	@user = user
    mail(:to => ApplicationHelper::COPY_EMAIL, :subject => "New EarPuff User")
  end
end
