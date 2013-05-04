require 'spec_helper'

describe "UserSignups" do

  subject { page }


  describe "signing up" do
		before do 
			visit root_path 
	    click_on("signup")
	    expect(page).to have_title "signup"
	    expect(page).to have_button "Signup"
	   end

    context "with valid input" do
      before do
				fill_in 'username', :with => "frankthetank"
        fill_in 'email', with: "frank@thetank.com"
        fill_in 'password', with: "passwo"
        fill_in 'confirmpassword', with: "passwo"
      end

      it "should create user" do
        expect {click_button "Signup" }.to change(User, :count).by(1)
      end
    end

    context "with invalid input" do
      subject { page }

      before do
        fill_in 'username', with: "frankthetank"
        fill_in 'email', with: "frank@thetank.com"
      end

      it "should not create user" do
        expect {click_button "Signup" }.not_to change(User, :count)
      end

      it "should generate error messages" do
        click_button 'Signup'
        should have_selector '.error_messages'
      end
    end
  end
end