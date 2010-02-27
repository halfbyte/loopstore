class AddSomeFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :nickname, :string
    add_column :users, :description, :text
  end

  def self.down
    remove_column :users, :description
    remove_column :users, :nickname
  end
end
