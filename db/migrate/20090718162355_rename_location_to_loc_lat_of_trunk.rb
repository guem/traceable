class RenameLocationToLocLatOfTrunk < ActiveRecord::Migration
  def self.up
    rename_column :trunks, :location, :loc_lat
  end

  def self.down
    rename_column :trunks, :loc_lat, :location
  end
end
