require 'spec_helper'

describe UserMailer do
  describe "password_reset" do
    let(:user) { FactoryGirl.create(:user, reset_password_token: "anything") }
    let(:mail) { UserMailer.password_reset(user) }

    it "send user password reset url" do
      mail.subject.should eq("Password Reset")
      mail.to.should eq([user.email])
      mail.from.should eq(["from@example.com"])
      mail.body.encoded.should match(edit_user_password_path(user.reset_password_token))
    end
  end
end
