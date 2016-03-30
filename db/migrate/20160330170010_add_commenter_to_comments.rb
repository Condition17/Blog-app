class AddCommenterToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :commenter_type, :string 
  	add_column :comments, :commenter_id, :integer
  end
end
