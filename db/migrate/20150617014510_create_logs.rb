class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :pdf
      t.string :date
      t.string :created_by
      t.timestamps
    end
  end
end
