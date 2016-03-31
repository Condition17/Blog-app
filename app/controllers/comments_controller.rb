class CommentsController < ApplicationController
	

	def create
		id = (params[:class].downcase+"_id").to_sym
		@current_post = params[:class].constantize.find_by_id(params[id])
		@current_comment = @current_post.comments.new(comment_params)
		@current_comment.user = User.find_by_id(session[:user_id])
		if(@current_comment.save)
			if ( @current_comment.parent_id )
				@parent_comment =  Comment.find_by_id(@current_comment.parent_id)
				@parent_user = @parent_comment.user
				CommentMailer.reply_email(@parent_user,@current_comment.user).deliver! if (@parent_user != @current_comment.user)
			end
		end
		redirect_to :back
	end

private
	def comment_params
		params.require(:comment).permit(:content,:parent_id)
	end
end

