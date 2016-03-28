class UserMailer < ApplicationMailer
	def user_email(user)
		mail(to: user.email, subject: "Welcome!")
	end
end
