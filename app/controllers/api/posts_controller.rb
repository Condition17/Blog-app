class Api::PostsController < ApplicationController
	def index
		@all_posts = Post.all
	
	end

	def show
		@post = Post.find_by_id(params[:id])
		
	end
end
