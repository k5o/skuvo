require 'spec_helper'

describe Photo do
  it { should respond_to :url }
  it { should respond_to :short_url }
  it { should belong_to(:user) }

  describe "model actions" do
  	it "should create a short url" do
  		photo = Photo.create
  		photo.short_url.should_not be_empty
  	end
  end
 end