class CommentMailer < ApplicationMailer
	def reply_email(parent_user, current_user)
		@current_user = current_user
		@parent_user = parent_user
		mail(to: parent_user.email, subject: "Hi! Someone replied to your comment.");
	end

end
