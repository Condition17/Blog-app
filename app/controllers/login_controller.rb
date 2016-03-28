class LoginController < ApplicationController
	
	def create

			user = User.find_by(username: params[:user])
		if(user && user.authenticate(params[:password]))
			session[:user_id] = user.id
			flash[:notice] = "You have been successfully logged in"
			redirect_to posts_path
		else
		flash[:alert]= "Invalid user or password"
		redirect_to login_new_path
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to root_path
	end
end
