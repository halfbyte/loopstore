class AddMessageIdToLoops < ActiveRecord::Migration
  def self.up
    add_column :loops, :message_id, :string
  end

  def self.down
    remove_column :loops, :message_id
  end
end
