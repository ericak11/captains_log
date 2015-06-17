class CreateOpenItems < ActiveRecord::Migration
  def change
    create_table :open_items do |t|
      t.string :task
      t.string :date
      t.integer :user_id
      t.string :notes
      t.boolean :completed
      t.timestamps
    end
  end
end
