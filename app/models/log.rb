class Log < ActiveRecord::Base
  has_many :expenses
  has_many :in_progresses
  has_many :open_items, through: :in_progresses
  belongs_to :created_by, class_name: 'User', foreign_key: :created_by
  has_many :on_duties
  has_many :users, through: :on_duties
  accepts_nested_attributes_for :expenses
end
