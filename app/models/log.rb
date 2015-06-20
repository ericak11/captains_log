class Log < ActiveRecord::Base
  has_many :expenses
  has_many :in_progresses
  has_many :open_items, through: :in_progresses
end
