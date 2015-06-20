class OpenItem < ActiveRecord::Base
  has_many :in_progresses
  has_many :logs, through: :in_progresses
end
