class User < ActiveRecord::Base
  has_many :comments

  validates :email , uniqueness:true

  has_attached_file :photo, :styles => { :medium => "200x200>", :thumb => "100x100>" }, default_url: "missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  before_create do |user|
    user.first_name = user.email.capitalize if user.first_name.blank?
  end
end
