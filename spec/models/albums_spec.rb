require 'spec_helper'

describe Album do
  it { should respond_to :url }
  it { should belong_to(:user) }
  it { should have_many(:photos) }

  describe "model actions" do
  	it "should create a url before saving to db" do
  		album = Album.new
  		album.save
  		album.url.should_not be_empty
  	end

    # it "shouldn't create duplicate urls" do
    #   album1 = Album.new
    #   album1.url = "aaaa"
    #   album1.save!
    #   album2 = Album.new
    #   album2.save!
    #   album2.url = "aaaa"
    #   album2.save!
    #   album2.url.should eq "aaaa"
    # end
  end
end