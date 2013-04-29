class User < ActiveRecord::Base
	attr_accessible :username, :email, :password, :password_confirmation
	has_secure_password
	has_many :photos
	before_save :encrypt_password
	before_create { generate_token(:auth_token) }

	validates :username, :format =>  { :with => /^[a-z0-9_-]$/}
	validates :username, :length => { :minimum => 3, :maximum => 16}
	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates :password, :length => { :minimum => 6 }
	validates_presence_of :email
	validates_uniqueness_of :username, :email

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_digest = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end

	def self.authenticate(email, password)
		user = find_by_email(email)
		if user && user.password_digest == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end
end