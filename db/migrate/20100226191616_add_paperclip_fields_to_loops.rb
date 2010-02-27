class AddPaperclipFieldsToLoops < ActiveRecord::Migration
  def self.up
    add_column :loops, :nan_file_name, :string
    add_column :loops, :nan_content_type, :string
    add_column :loops, :nan_file_size, :integer
    add_column :loops, :nan_updated_at, :datetime
  end

  def self.down
    remove_column :loops, :nan_updated_at
    remove_column :loops, :nan_file_size
    remove_column :loops, :nan_content_type
    remove_column :loops, :nan_file_name
  end
end
