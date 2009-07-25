class AddIndexToTrunks < ActiveRecord::Migration
  def self.up
    add_index :trunks, :traceable, :unique => true
  end

  def self.down
    remove_index :trunks, :traceable
  end
end
