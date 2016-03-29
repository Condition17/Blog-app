class ContactMailer < ApplicationMailer
	def reply_review(first_name, last_name, content, email)
		@first_name = first_name
		@last_name = last_name
		@content = content
		@email = email
		mail(to: 'suppot@myblog.com', subject: "Hi! Someone contacted you.")
	end
end
