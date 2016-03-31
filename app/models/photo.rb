class Photo < ActiveRecord::Base
	belongs_to :user
	has_attached_file :picture, styles: { medium: "30X30", thumb: "10X10" }, default_url:  "missing.jpg"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
