require 'spec_helper'

describe CommentsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:issue) { FactoryGirl.create(:issue, user: user) }
  let(:comment) { FactoryGirl.create(:comment, user: user, issue: issue) }

  before do
    login_user user
  end

  it "COMMENT #create" do
    expect{ post :create, "comment"=>{ "body"=> comment.body, "user_id" => user.id }, "commit"=>"Add Comment", "issue_id"=> issue.id }.to change(Comment, :count).by(2)
    response.body.should_not be_nil
  end

  it "COMMENT #destroy" do
    comment = FactoryGirl.create(:comment, user: user, issue: issue)
    expect{ delete :destroy, issue_id: issue.id, id: comment.id }.to change(Comment, :count).by(-1)
    response.body.should_not be_nil
  end
end
