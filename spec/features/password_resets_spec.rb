require 'spec_helper'
describe "PasswordResets" do
  it "emails user when requesting password reset" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    click_link 'Forgot your password?'
    fill_in "Email", :with => user.email
    click_button "Send me reset password instructions"
    current_path.should eq(new_user_session_path)
    page.should have_content("You will receive an email with instructions about how to reset your password in a few minutes.")
    last_email.to.should include(user.email)
  end

  it "does not email invalid user when requesting password reset" do
    visit new_user_session_path
    click_link 'Forgot your password?'
    fill_in "Email", :with => "nobody@example.com"
    click_button "Send me reset password instructions"
    page.should have_content("Email not found")
    last_email.should be_nil
  end

  it "updates the user password when confirmation matches" do
    user = FactoryGirl.create(:user, :reset_password_token => "qGRgK7AZwTkZkwADiJZB", :reset_password_sent_at => 1.hour.ago)
    path = edit_user_password_path + '/?reset_password_token=' + user.reset_password_token
    visit path
    # visit edit_user_password_path(user.reset_password_token)

    current_path.should eq(new_user_session_path)

    fill_in 'user[password]', :with => "12345678"
    fill_in 'user[password_confirmation]', :with => "12345678"
    click_button "Change my password"
    page.should have_content("Your password was changed successfully.")
  end

  # it "reports when password token has expired" do
  #   user = FactoryGirl.create(:user, :reset_password_token => "something", :password_reset_sent_at => 5.hour.ago)
  #   visit edit_password_reset_path(user.reset_password_token)
  #   fill_in "Password", :with => "12345678"
  #   fill_in "Password confirmation", :with => "12345678"
  #   click_button "Change my password"
  #   page.should have_content("Password reset has expired")
  # end

  it "raises record not found when password token is invalid" do
    # lambda {
    #   visit edit_user_password_path("invalid")
    # }.should raise_exception(ActiveRecord::RecordNotFound)

    path = edit_user_password_path + '/?reset_password_token=' + 'invalid_token'
    visit path
    click_button "Change my password"
    page.should have_content("Reset password token is invalid")
  end
end
