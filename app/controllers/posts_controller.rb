class PostsController < ApplicationController
	before_action :require_user
	
	
	def require_user
		if(!session[:user_id])
			flash[:alert] = "You have to be logged in to read or add posts"
			redirect_to login_new_path
		end
	
	end

	def new
		@post = Post.new
		@current_user = User.find_by_id(session[:user_id])
	end
	
	def create
		@post = Post.new(post_params)
		@post.user = User.find_by_id(session[:user_id])

		if(@post.save)
			flash[:notice] = "Post added"
			redirect_to posts_path
		else 
			flash[:validation_alert] = @post.errors.full_messages
			render "new"
		end

	end

	def index
		if(Post.all.empty?)	
			flash[:alert] = "There are no posts! Write a post :D"
			redirect_to new_post_path
		else
		@posts = Post.all
		end
	end

	def edit
 		@current_post = Post.find(params[:id])
	end

	def show
		@current_post = Post.find(params[:id])
	end

	def update
		@current_post = Post.find(params[:id])
		if (@current_post.update(post_params))
			flash[:notice] = "Successfully edited post"		
			redirect_to posts_path
		else 
			flash[:validation_alert] = @current_post.errors.full_messages
			redirect_to edit_post_path
	end

	end

	def destroy
		@current_post = Post.find(params[:id])
	
		if(@current_post.destroy) 
			flash[:notice] = "Successfully deleted article"
		else 
			flash[:alert] = "Error occured when tried to delete the article"
		end
		redirect_to posts_path
	end	

	private

	def post_params
		params.require(:post).permit(:title,:description)
	end
end
