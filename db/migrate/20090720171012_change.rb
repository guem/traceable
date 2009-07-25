class Change < ActiveRecord::Migration
  def self.up
    rename_table :species, :kinds
  end

  def self.down
    rename_table :kinds, :species
  end
end
