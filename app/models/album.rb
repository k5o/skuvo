class Album < ActiveRecord::Base
	belongs_to :user
	has_many :photos, :dependent => :destroy
	before_create :create_url

	def create_url
		self.url = SecureRandom.hex[0..3]
	end
end