FactoryGirl.define do
	factory :issue do
		title "go to work"
		description "rohit bhore"
	end

  factory :invalid_issue do
    title nil
    description nil
  end
end
