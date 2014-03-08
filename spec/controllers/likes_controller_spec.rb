require 'spec_helper'

describe LikesController do
  let(:user) { FactoryGirl.create(:user) }
  let(:issue) { FactoryGirl.create(:issue, user: user) }
  let(:like) { FactoryGirl.create(:like, user: user, issue: issue) }

  it "POST #create" do
    request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
    expect{ post :create, { "like"=>{ "issue_id"=> issue.id, "user_id"=> user.id }} }.to change(Like, :count).by(1)
    response.code.should eq("200")
    response.body.should_not be_nil
  end

  it "DELETE #destroy" do
    request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
    expect{ delete :destroy, id: like.id }.to change(Like, :count).by(-1)
    response.code.should eq("200")
    response.body.should_not be_nil
  end
end
