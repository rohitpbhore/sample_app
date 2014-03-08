require 'spec_helper'

describe CommentsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:issue) { FactoryGirl.create(:issue, user: user) }
  let(:comment) { FactoryGirl.create(:comment, user: user, issue: issue) }

  it "COMMENT #create" do
    request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
    expect{ post :create, "comment"=>{ "body"=> comment.body, "user_id" => user.id }, "commit"=>"Add Comment", "issue_id"=> issue.id }.to change(Comment, :count).by(2)
    response.body.should_not be_nil
  end

  it "COMMENT #destroy" do
    request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
    comment = FactoryGirl.create(:comment, user: user, issue: issue)
    expect{ delete :destroy, issue_id: issue.id, id: comment.id }.to change(Comment, :count).by(-1)
    response.body.should_not be_nil
  end
end
