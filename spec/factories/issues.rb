FactoryGirl.define do
	factory :issue do
		title "go to work"
		description "rohit bhore"
		no_followers 2
	end

  factory :invalid_issue do
    title nil
    description nil
    no_followers nil
  end

end
