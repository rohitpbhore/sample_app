require 'spec_helper'

describe Comment do
  it "is invalid without body" do
    comment = FactoryGirl.build(:comment, body: nil)
    expect(comment).to have(1).errors_on(:body)
  end

  it "is valid with body" do
    expect(FactoryGirl.build(:comment)).to be_valid
  end
end
