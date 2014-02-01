class Issue < ActiveRecord::Base
  attr_accessible :description, :no_followers, :title
  validates_presence_of :title
  validates_length_of :description, maximum: 12, minimum: 10
  validates_uniqueness_of :title, message: "Title should be unique"
  validates_numericality_of :no_followers, allow_blank: false

  validates_with Yesnovalidator

  belongs_to :project
  has_many :comments, dependent: :destroy

  after_save :add_to_timeline
  # before_save :strip_spaces_from_tag

  private
  def add_to_timeline
  	Timeline.create!({content: "Issue created", timelineable_id: id, timelineable_type: self.class.to_s })
  end

  # def strip_spaces_from_tag
  #   self.tags.gsub! ", ", ","
  # end
end
