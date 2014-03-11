class Issue < ActiveRecord::Base
  validates_presence_of :title, message: "Title can't be blank"
  validates_presence_of :description, message: "Description can't be blank"
  validates_length_of :description, minimum: 5, message: "Description is too short (minimum is 5 characters)"
  # validates_with Yesnovalidator

  after_save :add_to_timeline

  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :likes

  # attr_accessible :user_id, :description, :title

  accepts_nested_attributes_for :comments, :likes

  # before_save :strip_spaces_from_tag

  private
  def add_to_timeline
  	Timeline.create!({ content: "Issue created", timelineable_id: id, timelineable_type: self.class.to_s })
  end

  # def strip_spaces_from_tag
  #   self.tags.gsub! ", ", ","
  # end
end
