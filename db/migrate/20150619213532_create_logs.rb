class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :pdf
      t.string :date
      t.integer :created_by

      t.timestamps null: false
    end
  end
end
