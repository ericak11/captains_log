class InProgress < ActiveRecord::Base
  belongs_to :log
  belongs_to :open_item
end
