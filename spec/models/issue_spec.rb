require 'spec_helper'

describe Issue do
	it "is invalid with title has the word 'yes' and description has the word 'no'" do
		issue = FactoryGirl.build(:issue,title: 'yes',description: 'no no no no')
		expect(issue).to have(1).errors_on(:title)
	end

	it "is invalid without description" do
		issue = FactoryGirl.build(:issue,description: nil)
		expect(issue).to have(1).errors_on(:description)
	end

	it "is valid with a title, description" do
		expect(FactoryGirl.build(:issue)).to be_valid
	end
end
