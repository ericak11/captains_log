class CreateOnDuty < ActiveRecord::Migration
  def change
    create_table :on_duties do |t|
      t.integer :user_id
      t.integer :log_id
      t.string :status
    end
  end
end
