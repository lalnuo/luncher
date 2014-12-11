class Group < ActiveRecord::Base
  has_secure_password

  has_many :lunches, :dependent => :destroy

  validates :name, :uniqueness => true

  def todays_lunches
    self.lunches.select { |lunch|
      lunch.time.today?
    }
  end

  def self.create_or_auth(group_params)
    group =  Group.find_or_create_by(group_params)
    session[:group_id] = group.id
  end
end
