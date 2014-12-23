class Registration < ActiveRecord::Base
  belongs_to :lunch
  belongs_to :user

  validates :lunch_id, :presence => true
end
