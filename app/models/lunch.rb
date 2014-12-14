class Lunch < ActiveRecord::Base
  belongs_to :group
  has_many :registrations

  validates :name, :presence => true
  validates :time, :presence => true

  def lunch_times
    [['Today', 1], ['Tomorrow', 2]]
  end

  def time_gmt
    self.time.strftime('%H:%M')
  end
end
