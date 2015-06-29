class CompletedTask < ActiveRecord::Base
  belongs_to :log
  belongs_to :daily_activity
end
