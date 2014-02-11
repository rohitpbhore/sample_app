class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar

  has_attached_file :avatar, styles: { large: '500*500>', medium: '300*300>', small: '40*40>' }, url: "avatar/:style/:basename.:extension", path: "#{Rails.root}/app/assets/images/avatar/:style/:basename.:extension"

  validates_attachment_presence :avatar
  validates_attachment :avatar, content_type: { content_type: ['image/jpeg','image/png'] }, size: { in: 0..5.megabytes }
end
