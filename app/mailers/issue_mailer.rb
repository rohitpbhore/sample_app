class IssueMailer < ActionMailer::Base
  default from: "from@example.com"

  def issue_created(issue)
  	@issue = issue
  	mail subject: "A new issue was created", to: "rohit.icicle@gmail.com"
  end
end
