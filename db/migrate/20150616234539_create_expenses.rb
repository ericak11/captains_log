class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :type
      t.string :category
      t.integer :check_number
      t.string :check_to
      t.integer :amount
      t.string :notes
      t.timestamps
    end
  end
end
