class Photo < ActiveRecord::Base
	attr_accessible :url
	belongs_to :user

	before_create :create_short_url

	def create_short_url
		self.short_url = SecureRandom.hex[0..3]
	end
end