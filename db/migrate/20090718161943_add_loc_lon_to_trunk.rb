class AddLocLonToTrunk < ActiveRecord::Migration
  def self.up
    add_column :trunks, :loc_lon, :string
  end

  def self.down
    remove_column :trunks, :loc_lon
  end
end
