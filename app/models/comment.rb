class Comment < ActiveRecord::Base
  belongs_to :issue
  belongs_to :user
  validates_presence_of :body, message: "Can't be blank"
  attr_accessible :body, :commenter, :user_id
end
