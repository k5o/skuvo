class Album < ActiveRecord::Base
	belongs_to :user
	has_many :photos
	before_create :create_url
	
	private

	def random_url
		SecureRandom.hex(2)
	end

	def create_url
		url = random_url
		while Album.find_by_url(random_url) do
			url = random_url	
		end
		self.url = url
	end
end