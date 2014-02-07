require 'spec_helper'

describe "issues" do
	before do
    # sign_in
    visit issues_path
    click_link 'Sign up'
    fill_in 'user[email]', with: 'example@gg.com'
    fill_in 'user[password]', with: '12345678'
    fill_in 'user[password_confirmation]', with: '12345678'
    click_button 'Sign up'
    page.should have_content 'Welcome! You have signed up successfully.'
    @issue = FactoryGirl.create(:issue)
	end

  describe "GET /issues" do
    it "display some issues" do
    	visit issues_path
    	page.should have_content 'go to work'
    end

    it "creates a new issue" do
      visit issues_path
      visit new_issue_path

    	fill_in 'issue[title]', with: 'go to bed'
      fill_in 'issue[description]', with: 'go to work'
      fill_in 'issue[no_followers]', with: 3

    	click_button 'Create Issue'

      # current_path.should == issue_path
    	page.should have_content 'go to work'
      page.should have_content 'Issue was successfully created.'
    	# save_and_open_page
    end
  end

  describe "PUT /issues" do
  	it "edits a issue" do
  		visit issues_path
  		click_link 'Edit'

  		current_path.should == edit_issue_path(@issue)

  		find_field('issue[title]').value.should == 'go to work'

  		fill_in 'issue[title]', with: 'updated Issue'
  		click_button 'Update Issue'


  		page.should have_content 'updated Issue'
      page.should have_content 'Issue was successfully updated.'
      # current_path.should == issue_path
  	end

  	it "should not update an empty issue" do
  		visit issues_path
  		click_link 'Edit'

  		fill_in 'issue[title]', with: ''
  		click_button 'Update Issue'
      path = current_path + '/edit'
  		path.should  == edit_issue_path(@issue)
  		page.should have_content "Title can't be blank"
  	end
  end

  describe "DELETE /issues" do
  	it "should Destroy a issue" do
  		visit issues_path
  		find("#issue_#{@issue.id}").click_link 'Destroy'
  		page.should have_no_content 'go to work'
  	end
  end
end
