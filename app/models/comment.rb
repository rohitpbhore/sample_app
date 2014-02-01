class Comment < ActiveRecord::Base
  belongs_to :issue
  attr_accessible :body, :commenter
end
