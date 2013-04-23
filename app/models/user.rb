class User < ActiveRecord::Base
	attr_accessible :username, :email, :password
	has_secure_password
	has_many :photos
	
end