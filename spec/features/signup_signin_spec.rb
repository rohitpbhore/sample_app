require 'spec_helper'

describe "Signup/Signin" do
  it "Signup" do
    visit issues_path
    click_link 'Sign up'
    fill_in 'user[username]', with: 'example'
    fill_in 'user[email]', with: 'example@gg.com'
    fill_in 'user[password]', with: '12345678'
    fill_in 'user[password_confirmation]', with: '12345678'
    click_button 'Sign up'
    page.should have_content 'Welcome! You have signed up successfully.'
  end

  it "Signin" do
    @user = FactoryGirl.create(:user)
    visit new_user_session_path
    page.should have_content 'Sign in'
    fill_in 'user[login]', with: "#{@user.username}"
    fill_in 'user[password]', with: "#{@user.password}"
    click_button 'Sign in'
    page.should have_content  'Signed in successfully'
  end
end
