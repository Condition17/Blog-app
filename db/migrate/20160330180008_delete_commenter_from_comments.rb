class DeleteCommenterFromComments < ActiveRecord::Migration
  def change
  	remove_column :comments, :commenter_type, :string 
  	remove_column :comments, :commenter_id, :integer
  end
end
