class User < ActiveRecord::Base
  TYPES = %w(Admin Captain CrewMember)

  has_secure_password
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true
end
