class Physician < ActiveRecord::Base
  has_one :appointment
  has_many :patients , through: :appointments
end
