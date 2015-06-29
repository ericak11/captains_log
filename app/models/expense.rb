class Expense < ActiveRecord::Base
  belongs_to :log
  TYPES = %w[ Credit Check Cash ]

  def self.unassaigned_expenses
    Expense.where(log_id: nil)
  end
end

