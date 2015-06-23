class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :logs
  has_many :on_duties
  has_many :logs, through: :on_duties
  has_many :open_items
  has_many :daily_activities


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

  def self.crew
    self.where("role = ? OR role = ? AND active IS true", "captain", "crew_member")
  end
end
