module LoginHelper
  def login_user(user)
    visit login_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on "I'm back"
  end
end