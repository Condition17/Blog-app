class Comment < ActiveRecord::Base
	validates :content, presence:true
	belongs_to :commentable, polymorphic: true
	belongs_to :post
	belongs_to :user
	has_many :subcomments, class_name: "Comment", foreign_key: "parent_id" 
  	belongs_to :parent, class_name: "Comment"

end
