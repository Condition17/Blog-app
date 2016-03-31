class AddPhotosReferenceToUser < ActiveRecord::Migration
  def change
  	add_reference :users, :photo, index:true
  end
end
