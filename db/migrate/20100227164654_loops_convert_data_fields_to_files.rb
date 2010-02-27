class LoopsConvertDataFieldsToFiles < ActiveRecord::Migration
  def self.up
    Loop.all.each do |l|
      if !l.nan.file? && !l['data'].empty?
        l.data = l['data']
        l.save
      end
    end
    remove_column :loops, :data
  end

  def self.down
    add_column :loops, :data, :text
  end
end
