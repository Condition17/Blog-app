class UsersController < ApplicationController
	
	def new
		@new_user = User.new
	end

	def index
		@users = User.all
	end
	
	def create
		@new_user = User.new(user_params)
		@photo = Photo.new
	if @new_user.save
		@photo.user = @new_user
		@photo.save
		session[:user_id] = @new_user.id
		UserMailer.user_email(@new_user).deliver!
		flash[:notice] = "You are registered now"
		redirect_to posts_path
	else 
		flash[:alert] = @new_user.errors.full_messages
		redirect_to new_user_path

	end
end
	def edit
		@current_user = User.find_by_id( session[ :user_id] )
		@profile_picture = @current_user.photo
	end
	
	def update
		@current_user = User.find_by_id( params[:id] )
		@current_user.update( user_params)
		redirect_to posts_path
	end

	def show
		@current_user = User.find_by_id( params[:id] )
		@profile_picture = @current_user.photo
	end

private
def user_params
	params.require(:user).permit(:username,:password,:email,:password_confirmation,:photo)
end

def user_update_params
	params.require(:user).permit(:password,:email,:password_confirmation,:photo)
end


end

