class UsersController < ApplicationController
	def new
		@new_user = User.new
	end

	def create
		@new_user = User.new(user_params)

	if @new_user.save
		session[:user_id] = @new_user.id
		UserMailer.user_email(@new_user).deliver!
		flash[:notice] = "You are registered now"
		redirect_to posts_path
	else 
		flash[:alert] = @new_user.errors.full_messages
		redirect_to signup_path

	end
end

def user_params
	params.require(:user).permit(:username,:password,:email,:password_confirmation)
end

end

