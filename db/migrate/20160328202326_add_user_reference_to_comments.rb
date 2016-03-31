class AddUserReferenceToComments < ActiveRecord::Migration
  def change
  	add_reference :comments, :user, intex:true
  end
end
