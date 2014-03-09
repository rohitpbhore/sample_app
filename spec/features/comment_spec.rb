require 'spec_helper'

describe "posts" do
  before do
    signin
  end

  describe "COMMENTS" do
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
      @comment = FactoryGirl.create(:comment, issue: @issue1, user: @user)
      visit issue_path "#{@issue1.id}"
      find("#comment_#{@comment.id}").click_link 'Destroy'
      page.should have_no_content @comment.body
    end

    it "DESTROY /author of post can delete any comment" do
      @comment = FactoryGirl.create(:comment, issue: @issue1, user: nil)
      visit issue_path "#{@issue1.id}"
      find("#comment_#{@comment.id}").click_link 'Destroy'
      page.should have_no_content @comment.body
    end

    it "COMMENT /author can only delete comment" do
      click_link 'Logout'
      visit issues_path
      click_link 'Sign up'
      fill_in 'user[username]', with: 'example'
      fill_in 'user[email]', with: 'example1@gg.com'
      fill_in 'user[password]', with: '12345678'
      fill_in 'user[password_confirmation]', with: '12345678'
      click_button 'Sign up'
      page.should have_content 'Welcome! You have signed up successfully.'
      @user2 = User.find_by_email('example1@gg.com');
      @issue2 = FactoryGirl.create(:issue, user_id: @user.id)
      @comment = FactoryGirl.create(:comment, issue: @issue1, user: @user)
      visit issue_path "#{@issue1.id}"

      lambda {
      find("#comment_#{@comment.id}").click_link 'Destroy'
      }.should raise_exception(AbstractController::ActionNotFound)
    end
  end
end
