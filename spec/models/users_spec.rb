require 'spec_helper'

describe User do
  it { should validate_presence_of :username }
  it { should respond_to :username }
  it { should validate_uniqueness_of :username }
  it { should validate_presence_of :email }
  it { should respond_to :email }
  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :password }
  it { should have_many(:photos) }

  describe "validations on valid usernames" do
    
    it "should accept frankthetank" do
      user = FactoryGirl.build(:user) 
      user.should be_valid
    end   
  end

  describe "validations on invalid usernames" do
    it "should not accept non-alphanumeric characters" do
      user = FactoryGirl.build(:user, username: "Frank za Czołg")
      user.should_not be_valid
      user.should have(1).error_on(:username)
    end

    it "should not accept usernames under 3 characters" do
      user = FactoryGirl.build(:user, username: "ft")
      user.should_not be_valid 
      user.should have(2).error_on(:username) # 2 because regex results in an extra error
    end

    it "should not accept usernames over 16" do
      user = FactoryGirl.build(:user, username: "frankdenkampvogn912384")
      user.should_not be_valid
      user.should have(2).error_on(:username) # 2 because regex results in an extra error
    end

    it "should not accept duplicate usernames" do
      user1 = FactoryGirl.create(:user, username: "frankdiepanzer")
      user2 = FactoryGirl.build(:user, username: "frankdiepanzer")
      user2.should_not be_valid
      user2.should have(1).error_on(:username)
    end

    it "should not accept passwords under 6 characters" do
      user = FactoryGirl.build(:user, password: "foo")
      user.should_not be_valid
      user.should have(1).error_on(:password)
    end
  end

  describe "validations on email" do
    it "should accept frank@thetank.com" do
      user = FactoryGirl.build(:user)
      user.should be_valid
    end

    it "should accept frank+the@tank.me" do
      user = FactoryGirl.build(:user, email: "frank+the@tank.me")
      user.should be_valid
    end

    it "should not accept impossible e-mails" do
      user = FactoryGirl.build(:user, email: "frank@panssarivaunu.fi..nland")
      user.should_not be_valid
      user.should have(1).error_on(:email)
    end

    it "should not accept duplicate emails" do
      user1 = FactoryGirl.create(:user, email: "frank_den@stridsvagn.se")
      user2 = FactoryGirl.build(:user, email: "frank_den@stridsvagn.se")
      user2.should_not be_valid
      user2.should have(1).error_on(:email)
    end
  end

  describe "model actions" do
    it "should generate a salt and digest" do
      user = FactoryGirl.create(:user)
      user.password.should_not eq user.password_salt
      user.password_salt.should_not eq user.password_digest
    end

    it "should generate a user token" do
      user = FactoryGirl.create(:user)
      user.auth_token.should_not be_empty
    end

    it "should downcase the username before submitting it to the database" do
      user = FactoryGirl.create(:user, username: "FrankDeVoertuig")
      user.username.should eq "frankdevoertuig"
    end
  end
end