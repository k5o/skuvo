class Photo < ActiveRecord::Base
  attr_accessible :url
  belongs_to :user
  belongs_to :album

  before_create :create_short_url

  private

    def random_short_url
      SecureRandom.hex(2)
    end

    def create_short_url
      url = random_short_url

      while Photo.find_by_short_url(random_short_url) do
        url = random_short_url  
      end
      
      self.short_url = url
    end
end