class ForgetPasswordMailer < ApplicationMailer

	def forget_password(user)
    @user = user

    mail(to: @user.email_id, subject: "reset password!")
  end
end
