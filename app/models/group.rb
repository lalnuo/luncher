class Group < ActiveRecord::Base
  has_secure_password

  has_many :lunches, :dependent => :destroy

  validates :name, :uniqueness => true

  def todays_lunches
    self.lunches.select { |lunch|
      lunch.time.today?
    }
  end
end
