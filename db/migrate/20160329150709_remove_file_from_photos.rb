class RemoveFileFromPhotos < ActiveRecord::Migration
  def change
  	remove_attachment :photos, :file
  end
end
