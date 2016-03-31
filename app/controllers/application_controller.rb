class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
  layout "copyright"

  before_action :seed_user

  	def seed_user
  		session[:user] = {username:"Gicu",password:"asd"}
  	end
	



end
