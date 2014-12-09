class Lunch < ActiveRecord::Base
  belongs_to :group
  has_many :registrations

  validates :name, :presence => true
  validates :time, :presence => true

end
