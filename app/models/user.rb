class User < ActiveRecord::Base
	has_one :photo
	has_many :posts
	has_many :comments, as: :commentable
	validates :username, presence:true
	validates :username, uniqueness:true, length:{in: 2..10},
	unless: "username.blank?"

	validates :password, length:{in: 6..20},
    unless: "password.blank?"

    validates :email, presence: true

    validates :email, email:true, uniqueness:true,
    unless: "email.blank?"
	has_secure_password

end
