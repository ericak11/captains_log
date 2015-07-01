class AddAttachmentPdfToLogs < ActiveRecord::Migration
  def self.up
    remove_column :logs, :pdf
    change_table :logs do |t|
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :logs, :pdf
    add_column :logs, :pdf, :string
  end
end
