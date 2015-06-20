class AddExpenseIdToLog < ActiveRecord::Migration
  def change
    add_column :expenses, :log_id, :integer
  end
end
