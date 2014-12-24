class Group < ActiveRecord::Base
  has_secure_password

  has_many :lunches, :dependent => :destroy
  has_many :user_groups
  has_many :users, :through => :user_groups

  validates :name, :uniqueness => true
  validates :city, :presence => true


  def todays_lunches
    self.lunches.select { |lunch|
      lunch.time.today?
    }
  end

  def user_has_access?(user_id, group_permissions = [])
    if self.public || group_permissions.include?(self.id)
      return true
    end
    self.users.include?(User.find(user_id))
  end

  def self.find_by_name_and_auth(name, password)
    g = Group.find_by(:name => name)
    g.authenticate(password) if g
  end

  def self.create_or_auth(group_params)
    group =  Group.find_or_create_by(group_params)
    session[:group_id] = group.id
  end

  def self.public_groups
    Group.where(:public => true)
  end
end
