class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :type
      t.string :password_digest
      t.string :job_title
      t.boolean :active

      t.timestamps null: false
    end
  end
end
