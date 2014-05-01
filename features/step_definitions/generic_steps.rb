# And /^I should see(?: error| success)? (?:message|content) "(.*?)"$/ do |message|
#   page.should have_content(message)
# end

# And /^I should not see (?:message|content)? "(.*?)"$/ do |message|
#   page.should_not have_content(message)
# end

# Then /^I should see "(\d+)" "(.*?)" on screen$/ do |n, content|
#   all(content).size.should == n
# end

# Then /^I should see (.*?) on screen$/ do |content|
#   page.should have_content(content)
# end

# When /^I click "(.*?)" button$/ do |button_text|
#   click_button(button_text)
# end

# When /^I click "(.*?)" link$/ do |link_text|
#   click_link(link_text)
# end

# Helper step
Given /^I open page in browser$/ do
  save_and_open_page
end

# Given /^Wait for "(\d+)" seconds$/ do |sec|
#   sleep(sec.to_i)
# end

# Given /^I print current path$/ do
#   puts current_path
# end
