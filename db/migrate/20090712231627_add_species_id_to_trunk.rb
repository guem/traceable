class AddSpeciesIdToTrunk < ActiveRecord::Migration
  def self.up
    add_column :trunks, :species_id, :integer
  end

  def self.down
    remove_column :trunks, :species_id
  end
end
