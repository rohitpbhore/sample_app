Given(/^I am logged in$/) do
  visit '/issues/new'
  @user = FactoryGirl.create(:user)
  find("#user_login").set @user.email
  find("#user_password").set @user.password
  click_button "Sign in"
end

Given(/^I already have a valid post$/) do
  @post = FactoryGirl.create(:issue, user: @user)
end

When(/^I visit create post screen$/) do
  visit '/issues/new'
end

Then(/^I should see create post form$/) do
  # save_and_open_page
  # find("form#new_issue")
  # page.should have_content 'New post'
end

Then(/^I fill in "(.*?)", "(.*?)"$/) do |title, content|
  fill_in "Title", with: title
  fill_in "Description", with: content
  click_button "Submit"
end

When(/^I visit edit post screen$/) do
  visit "/issues/#{@post.id}/edit"
end

Then(/^I should see edit post form$/) do
  page.should have_content 'Edit post'
end

When(/^I visit dashboard$/) do
  visit root_path
end

Then(/^I should see post$/) do
  page.should have_content @post.title
end

Then(/^I delete post$/) do
  click_on "Destroy"
end

Then(/^I should not see post$/) do
  page.should_not have_content @post.title
end
