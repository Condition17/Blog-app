class PhotosController < ApplicationController
	def new
		 @photo = Photo.new
	end

	def create

		@photo = Photo.new(photos_params)
		@photo.user = User.find_by_id(session[:user_id])
    	if @photo.save
      		redirect_to @photo
   		 else	
    	  render :new
		end
	end
	
	def edit
		@User = User.find_by_id(params[:user_id])
 		@Photo = @User.photo
		redirect_to new_photo_path if !@Photo
 	end

 	def update
 		@Photo = Photo.find_by_id( params[:id] )
 		@Photo.update(photos_params)
 		redirect_to edit_user_path
 	end

 	def show
 		@Photo = Photo.find_by_id( params[:id] )
 	end
private
	 def photos_params
      params.require(:photo).permit(:picture)
    end
end
