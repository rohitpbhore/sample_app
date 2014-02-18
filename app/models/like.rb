class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :issue

  attr_accessible :issue_id
  # attr_accessible :title, :body
end
