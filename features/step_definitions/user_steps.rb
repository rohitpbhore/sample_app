# signin

Given(/^I am not logged in$/) do
  visit root_path
end

When(/^I visit user sign in screen$/) do
   visit new_user_session_path
end

Then(/^I should see sign in form$/) do
  page.should have_content("Sign in")
end

Given(/^I already have a valid account$/) do
  user = FactoryGirl.create(:user, email: 'rohit@gmail.com')
end

When(/^I login with "(.*?)", "(.*?)"$/) do |email, password|
  find("#user_login").set email
  find("#user_password").set password
  click_button "Sign in"
end

Then(/^I should see "(.*?)"$/) do |error_message|
  page.should have_content error_message
end

Then(/^I am redirected to dashboard screen$/) do
  current_path.should == root_path
end

Then(/^I should see success message$/) do
  page.should have_content 'Signed in successfully.'
end

# signout

Given(/^I am already logged in$/) do
  visit new_user_session_path
  current_user = FactoryGirl.create(:user, email: 'rohit@gmail.com')
  find("#user_login").set current_user.email
  find("#user_password").set current_user.password
  click_button "Sign in"
  page.should have_content 'Signed in successfully.'
end

When(/^I sign out of the application$/) do
  visit root_path
  current_path.should == root_path
  click_link 'Logout'
end

Then(/^I should be redirected to dashboard screen$/) do
  current_path.should == root_path
end

Then(/^I should see message "(.*?)"$/) do |message|
  page.should have_content message
end

When(/^I visit new post path$/) do
  visit new_issue_path
end

Then(/^I should be redirected to sign in screen$/) do
  current_path.should == new_user_session_path
end

# signup

When(/^I go to signup screen$/) do
  visit new_user_registration_path
end

Then(/^I should see signup form$/) do
  current_path.should == new_user_registration_path
end

When(/^I fill in "(.*?)", "(.*?)", "(.*?)", "(.*?)"$/) do |username, email, password, password_confirmation|
  find("#user_username").set username
  find("#user_email").set email
  find("#user_password").set password
  find("#user_password_confirmation").set password_confirmation
  click_button "Sign up"
end

Given(/^I am already registered in the system with email "(.*?)"$/) do |email|
  FactoryGirl.create(:user, email: email)
end

When(/^I sign up with same email id "(.*?)"$/) do |email|
  visit new_user_registration_path
  find("#user_username").set "username"
  find("#user_email").set email
  find("#user_password").set "password"
  find("#user_password_confirmation").set "password"
  click_button "Sign up"
end

Then(/^I should see error message "(.*?)"$/) do |message|
  page.should have_content message
end

When(/^I sign up with valid data$/) do
  visit new_user_registration_path
  find("#user_username").set "username"
  find("#user_email").set "email@ghhg.bh"
  find("#user_password").set "password"
  find("#user_password_confirmation").set "password"
  click_button "Sign up"
end

Then(/^I am redirected to dashboard$/) do
  current_path.should == root_path
end

Then(/^I should see welcome message "(.*?)"$/) do |msg|
  page.should have_content msg
end
