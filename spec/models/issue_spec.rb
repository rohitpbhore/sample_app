require 'spec_helper'

describe Issue do

	# # Rspec with before block
	# describe "Validates presence of" do

	# 	before :each do
	# 		@issue = Issue.create(title: 'title',description: 'rohit bhore', no_followers: 2)
	# 	end

	# 	context "Valid with all attributes" do
	# 		it "is valid with a title, description and no_followers" do
	# 			expect(@issue).to be_valid
	# 		end
	# 	end

	# 	context "Invalid with nil attributes" do
	# 		it "does not allow duplicate title" do
	# 			issue_new = Issue.new(title: 'title',description: nil, no_followers: nil)
	# 			expect(issue_new).to have(1).errors_on(:title)
	# 		end
	# 	end
	# end

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

	it "does not allow duplicate title" do
		# FactoryGirl.create(:issue)
		Issue.create(title: 'title',description: 'rohit bhore')
		issue_new = Issue.new(title: 'title',description: nil)
		expect(issue_new).to have(1).errors_on(:title)
	end
end
