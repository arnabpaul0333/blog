class Comment < ActiveRecord::Base
  belongs_to :users

  validates :comment , presence: true
end
