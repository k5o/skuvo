require 'spec_helper'

describe Album do
  it { should respond_to :url }
  it { should belong_to(:user) }
  it { should have_many(:photos).dependent(:destroy) }

  describe "model actions" do
  	it "should create a url before saving to db" do
  		album = Album.new
  		album.save
  		album.url.should_not be_empty
  	end
  end
 end