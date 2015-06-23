class CreateCompletedTasks < ActiveRecord::Migration
  def change
    create_table :completed_tasks do |t|
      t.integer :daily_activity_id
      t.integer :log_id
      t.boolean :completed
      t.string :notes
    end
  end
end
