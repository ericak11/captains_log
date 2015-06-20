class AddNotesColumnToInProgress < ActiveRecord::Migration
  def change
    add_column :in_progresses, :notes, :string
  end
end
