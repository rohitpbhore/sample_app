module LoginMacros
  def login_user(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in user
  end

  def signin(user)
    visit new_user_registration_path
    click_link 'Sign up'
    fill_in 'user[username]', with: user.username
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: '12345678'
    fill_in 'user[password_confirmation]', with: '12345678'
    click_button 'Sign up'
    page.should have_content 'Welcome! You have signed up successfully.'
  end
end
