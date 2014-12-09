class Registration < ActiveRecord::Base
  belongs_to :lunch

  validates :lunch_id, :presence => true
end
