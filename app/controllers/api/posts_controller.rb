class Api::PostsController < ApplicationController
	skip_before_action :verify_authenticity_token
	def index
		@all_posts = Post.all
	
	end

	def create
		@post = Post.new(post_params)
		if session[:user_id]
			@post.user = User.find_by_id(session[:user_id])
			if @post.save
				render json: @post
			else raise
			end
		else raise
		end
	rescue
		render json: {message: "Not good"}
	end

	def update
		@current_post = Post.find_by_id(params[:id])
		@updated_post = @current_post.update(post_params)
		if  @updated_post
			render json: @current_post
		else
			render json: {message: "Not good"}
		end
	end

	def show
		@post = Post.find_by_id(params[:id])
		
	end

	def destroy
		@current_post = Post.find_by_id(params[:id])
		@destroied_post = @current_post.destroy
		if( @destroied_post ) 
			render json: {message: "Successfully deleted post"}
		else 
			render json: {error_message: "The post can't be deleted"}
		end
	end

	def post_params
		params.require(:post).permit(:title,:description)
	end
end
