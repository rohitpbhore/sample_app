require 'spec_helper'

describe "posts" do
	before do
    # sign_in
    visit issues_path
    click_link 'Sign up'
    fill_in 'user[username]', with: 'example'
    fill_in 'user[email]', with: 'example@gg.com'
    fill_in 'user[password]', with: '12345678'
    fill_in 'user[password_confirmation]', with: '12345678'
    click_button 'Sign up'
    page.should have_content 'Welcome! You have signed up successfully.'
    @issue1 = FactoryGirl.create(:issue)
	end

  describe "GET /issues" do
    it "display some posts" do
    	visit issues_path
    	page.should have_content 'go to work'
    end

    it "CREATE /posts" do
      visit issues_path
      visit new_issue_path
    	fill_in 'issue[title]', with: 'go to bed'
      fill_in 'issue[description]', with: 'go to work'
    	click_button 'Submit'
    	page.should have_content 'go to work'
      page.should have_content 'Post was successfully created.'
    	# save_and_open_page
    end
  end

  describe "UPDATE /posts" do
  	it "edits a issue" do
  		visit issues_path
  		visit edit_issue_path(@issue1)
  		find_field('issue[title]').value.should == @issue1.title
  		fill_in 'issue[title]', with: 'updated Post'
  		click_button 'Submit'
  		page.should have_content 'updated Post'
      page.should have_content 'Post was successfully updated.'
  	end

  	it "should not update an empty post" do
  		visit issues_path
      visit edit_issue_path(@issue1)
  		fill_in 'issue[title]', with: ''
  		click_button 'Submit'
      path = current_path + '/edit'
  		path.should  == edit_issue_path(@issue1)
  		page.should have_content "Title can't be blank"
  	end
  end

  describe "DELETE /issues" do
  	it "should Destroy a post" do
  		visit issues_path
  		find("#issue_#{@issue1.id}").click_link 'Destroy'
  		page.should have_no_content @issue1.title
  	end
  end

  describe "COMMENTS" do
    @user = FactoryGirl.create(:user)
    @comment = FactoryGirl.create(:comment, issue: @issue1, user: @user)
    it "INDEX /comments" do
      page.should have_no_content @issue1.title
      page.should have_no_content @issue1.description
    end

    it "CREATE /commnet" do
      visit issue_path "#{@issue1.id}"
      fill_in 'comment[body]', with: 'comment body'
      click_button 'Add Comment'
      page.should have_content 'comment body'
    end

    it "DESTROY /commnet" do
      # @comment = FactoryGirl.create(:comment, issue: @issue1, user: @user)
      visit issue_path "#{@issue1.id}"
      find("#comment_#{@comment.id}").click_link 'Destroy'
      page.should have_no_content @comment.body
    end
  end

  # describe "LIKE/UNLIKE" do
  #   @like = FactoryGirl.create(:like, issue: @issue1, user: @user)
  #   Rails.logger.debug '-----------------------------'
  #   Rails.logger.debug @like.inspect
  #   Rails.logger.debug '-----------------------------'
  #   visit issue_path "#{@issue1.id}"
  #   it "LIKE /create" do
  #     click_button 'Follow'
  #     page.should have_content 'Unfollow'
  #   end

  #   it "LIKE /destroy" do
  #     click_button 'Unfollow'
  #     page.should have_content 'Follow'
  #   end
  # end
end
