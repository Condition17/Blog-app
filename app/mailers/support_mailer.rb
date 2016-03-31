class SupportMailer < ApplicationMailer
	def send(first_name, last_name, content, email)
		@first_name = first_name
		@last_name = last_name
		@content = content
		@emai = email
		mail(to: "suppot@myblog.com", subject: "Hi! Someone contacted you.")
	end
end
