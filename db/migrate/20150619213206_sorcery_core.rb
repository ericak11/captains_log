class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt
      t.string :name
      t.string :role
      t.string :job_title
      t.boolean :active
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end

