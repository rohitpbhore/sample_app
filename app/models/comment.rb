class Comment < ActiveRecord::Base
  belongs_to :issue
  belongs_to :user
  validates_presence_of :body, message: "Comment can't be blank"
  attr_accessible :body, :user_id
end
