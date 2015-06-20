class AddExpenseIdToLog < ActiveRecord::Migration
  def change
    add_column :logs, :expense_id, :integer
  end
end
