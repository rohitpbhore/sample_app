class Comment < ActiveRecord::Base
  belongs_to :issue
  validates_presence_of :commenter, :body
  attr_accessible :body, :commenter
end
