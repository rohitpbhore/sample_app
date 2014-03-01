require 'spec_helper'

describe "posts" do
  describe "signin" do
    it "signin" do
      @user = FactoryGirl.create(:user)
      visit new_user_session_path
      page.should have_content 'Sign in'
      fill_in 'user[login]', with: 'username'
      fill_in 'user[password]', with: 'password'
      click_button 'Sign in'
      page.should have_content  'Signed in successfully'
    end
  end
end
