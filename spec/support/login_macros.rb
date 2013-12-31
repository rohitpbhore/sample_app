module LoginMacros
  def set_user_session(user)
    session[:user_id] = user.id
  end

  def sign_in
    visit issues_path
    click_link 'Sign up'
    fill_in 'user[email]', :with => 'example@gg.com'
    fill_in 'user[password]', :with => '12345678'
    fill_in 'user[password_confirmation]', :with => '12345678'
    click_button 'Sign up'
    page.should have_content 'Welcome! You have signed up successfully.'
  end
end
