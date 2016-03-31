class Api::UsersController < ApplicationController
	def index 
		@users = User.all
		render json: @users
	end

	def show
		@current_user = User.find_by_id(params[:id])
		render json: @current_user
	end
end
