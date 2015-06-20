class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :logs
  validates :password,
    length: { minimum: 6 },
    presence: true,
    confirmation: true,
    :if => lambda{ new_record? || !password.nil? }

  validates :password_confirmation,
    presence: true,
    :if => lambda{ new_record? || !password.nil? }

  validates :email, uniqueness: true
  royce_roles %w[ admin captain crew_member ]

end
