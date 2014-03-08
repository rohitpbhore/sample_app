class Issue < ActiveRecord::Base
  attr_accessible :description, :title#, :no_followers,
  validates_presence_of :title, message: "Title can't be blank"
  validates_length_of :description, minimum: 5, message: "Description is too short (minimum is 5 characters)"
  # validates_numericality_of :no_followers, allow_blank: false

  validates_with Yesnovalidator

  belongs_to :project
  has_many :comments, dependent: :destroy

  attr_accessible :user_id

  after_save :add_to_timeline
  # before_save :strip_spaces_from_tag
  belongs_to :user
  has_many :likes

  private
  def add_to_timeline
  	Timeline.create!({content: "Issue created", timelineable_id: id, timelineable_type: self.class.to_s })
  end

  # def strip_spaces_from_tag
  #   self.tags.gsub! ", ", ","
  # end
end
