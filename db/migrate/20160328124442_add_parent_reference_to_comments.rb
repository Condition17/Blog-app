class AddParentReferenceToComments < ActiveRecord::Migration
  def change
  	add_reference :comments, :parent, intex:true
  end
end
