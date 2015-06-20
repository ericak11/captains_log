class OpenItem < ActiveRecord::Base
  has_many :in_progresses
  has_many :logs, through: :in_progresses
  belongs_to :user

  def self.current_open_items
    self.where("completed IS NOT true")
  end
end
