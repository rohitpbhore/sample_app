module LoginMacros
  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in user
  end

  def signin
    visit issues_path
    click_link 'Sign up'
    fill_in 'user[username]', with: 'example'
    fill_in 'user[email]', with: 'example@gg.com'
    fill_in 'user[password]', with: '12345678'
    fill_in 'user[password_confirmation]', with: '12345678'
    click_button 'Sign up'
    page.should have_content 'Welcome! You have signed up successfully.'
    @user = User.find_by_email('example@gg.com');
    @issue1 = FactoryGirl.create(:issue, user_id: @user.id)
  end
end
