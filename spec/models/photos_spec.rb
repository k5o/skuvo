require 'spec_helper'
require 'securerandom'

describe Photo do
  let(:photo) { FactoryGirl.create(:photo) }
  subject { photo }

  it { should respond_to :url }
  it { should respond_to :short_url }
  it { should belong_to(:user) }
  it { should belong_to(:album) }

  describe "model actions" do
  	it "should create a short url" do
  		photo = Photo.create
  		photo.short_url.should_not be_empty
  	end

    # it "shouldn't create duplicate short urls" do
      # subject.short_url = "aaaa"
      # subject.save!

      # SecureRandom.expects(:hex).with(2).returns('aaaa').twice
      # SecureRandom.expects(:hex).with(2).returns('aaab').at_least(:once)

      # FactoryGirl.create(:photo).short_url.should == 'asaab'
    # end
  end
end