class CreateInProgress < ActiveRecord::Migration
  def change
    create_table :in_progresses do |t|
      t.integer :log_id
      t.integer :open_item_id
    end
  end
end
