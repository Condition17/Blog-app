class ContactsController < ApplicationController
	def new
		render "pages/contact"

	end
	
	def create
	
		 ContactMailer.reply_review( params[:nume], params[:prenume], params[:comment], (User.find_by_id(session[:user_id])).email).deliver!
		  flash[:notice] = "Contact saved"
		 redirect_to new_contact_path
		 
	end
	def show
		@nume = session[:nume]
		@prenume = session[:prenume]
		@email = session[:email]
		@comm = session[:comment]
	end
end
