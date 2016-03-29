class RemoveParentIdFormComments < ActiveRecord::Migration
  def change
  	 remove_column :comments, :parent_id, :integer
  end
end
