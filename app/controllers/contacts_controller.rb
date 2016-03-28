class ContactsController < ApplicationController
	def new
		render "pages/contact"
	end
	
	def create
		 session[:nume] = params[:nume]	
		 session[:prenume] = params[:prenume]
		 session[:email] = params[:email]
		 session[:comment] = params[:comment]
		 flash[:notice] = "Contact saved"
		 redirect_to contacts_show_path
	end

	def show
		@nume = session[:nume]
		@prenume = session[:prenume]
		@email = session[:email]
		@comm = session[:comment]
	end
end
