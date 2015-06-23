class Expense < ActiveRecord::Base
  belongs_to :log
  TYPES = %w[ credit check cash ]
end

