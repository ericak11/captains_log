class OnDuty < ActiveRecord::Base
  belongs_to :log
  belongs_to :user
end
