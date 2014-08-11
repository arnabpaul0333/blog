class User < ActiveRecord::Base
  has_many :comments
  validates :email , uniqueness:true
  before_create do |user|
    user.first_name = user.email.capitalize if user.first_name.blank?
  end
end
