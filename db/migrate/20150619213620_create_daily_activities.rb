class CreateDailyActivities < ActiveRecord::Migration
  def change
    create_table :daily_activities do |t|
      t.integer :user_id
      t.string :description
      t.string :date

      t.timestamps null: false
    end
  end
end
