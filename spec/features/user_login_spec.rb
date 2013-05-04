require 'spec_helper'

describe "UserLogins" do

  subject { page }

  describe "logging in" do
  	let(:user) { FactoryGirl.create(:user) }

		before do 
			visit root_path 
	    click_on("login")
	    expect(page).to have_title "login"
	    expect(page).to have_button "I'm back"
	   end

    context "with valid input" do
      before do
        login_user(user)
      end

      it "should log user in" do
        current_path.should == root_path
        should have_content("Hi, " + user.username)
      end
    end

    context "with invalid input" do
      subject { page }

      before do
        fill_in 'email', with: "zzzzz"
        fill_in 'password', with: user.password
        click_on "I'm back"
      end

      it "should not log user in and generate error messages" do
        should have_content "Invalid"
      end
    end
  end
end