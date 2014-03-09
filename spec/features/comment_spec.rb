require 'spec_helper'

describe "posts" do
  before do
    @user = User.create(email: 'user@example.com', username: 'username')
    signin @user
    @user = User.find_by_email("#{@user.email}");
    @issue = FactoryGirl.create(:issue, user_id: @user.id)
  end

  describe "COMMENTS" do
    @comment = FactoryGirl.create(:comment, issue: @issue, user: @user)
    it "INDEX /comments" do
      page.should have_no_content @issue.title
      page.should have_no_content @issue.description
    end

    it "CREATE /commnet" do
      visit issue_path "#{@issue.id}"
      fill_in 'comment[body]', with: 'comment body'
      click_button 'Add Comment'
      page.should have_content 'comment body'
    end

    it "DESTROY /commnet" do
      @comment = FactoryGirl.create(:comment, issue: @issue, user: @user)
      visit issue_path "#{@issue.id}"
      find("#comment_#{@comment.id}").click_link 'Destroy'
      page.should have_no_content @comment.body
    end

    it "DESTROY /author of post can delete any comment" do
      @comment = FactoryGirl.create(:comment, issue: @issue, user: nil)
      visit issue_path "#{@issue.id}"
      find("#comment_#{@comment.id}").click_link 'Destroy'
      page.should have_no_content @comment.body
    end

    it "COMMENT /author can only delete comment" do
      click_link 'Logout'
      @user2 = User.create(email: 'user2@example.com', username: 'username2')
      signin @user2
      @user2 = User.find_by_email("#{@user2.email}");
      @issue2 = FactoryGirl.create(:issue, user_id: @user.id)

      @comment = FactoryGirl.create(:comment, issue: @issue, user: @user)
      visit issue_path "#{@issue.id}"

      lambda {
      find("#comment_#{@comment.id}").click_link 'Destroy'
      }.should raise_exception(AbstractController::ActionNotFound)
    end
  end
end
