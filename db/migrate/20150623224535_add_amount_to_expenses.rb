class AddAmountToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :amount, :decimal, :precision => 8, :scale => 2
  end
end
