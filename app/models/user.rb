class User < ActiveRecord::Base
  has_secure_password

  has_many :user_groups
  has_many :groups, :through => :user_groups

  validates :username, :uniqueness => true
  validates :username, :presence => true

  def self.login (username, password)
    user = self.find_by(:username => username)
    user.authenticate(password) if user
    user
  end
end
