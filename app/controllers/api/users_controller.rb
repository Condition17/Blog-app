class Api::UsersController < ApplicationController
	skip_before_action :verify_authenticity_token
	def create
		@new_user = User.new(user_params)
		if @new_user.save
			render json: @new_user
		else
			render json: {error_messages: @new_user.errors.full_messages}
		end
	end
	
	def index 
		@users = User.all
		render json: @users
	end

	def update
		@current_user = User.find_by_id(params[:id])
		@updated_user = @current_user.update_attributes(user_params)
		if @updated_user
			render json: @updated_user
		else
			render json: {error_message: "Not good"}
		end
	end

	def destroy
		@current_user = User.find_by_id(params[:id])
		@destroied_user = @current_user.destroy
		if( @destroied_user ) 
			render json: {message: "Successfully deleted user"}
		else 
			render json: {error_message: "The user can't be deleted"}
		end

	end
	
	def show
		@current_user = User.find_by_id(params[:id])
		render json: @current_user
	end

def user_params
	params.require(:user).permit(:username,:password,:email,:password_confirmation,:photo)
end

end
