require 'spec_helper'

describe "Signup/Signin" do
  it "Signup" do
    @user = User.create(email: 'user@example.com', username: 'username')
    signin @user
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
