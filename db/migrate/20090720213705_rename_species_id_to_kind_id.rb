class RenameSpeciesIdToKindId < ActiveRecord::Migration
  def self.up
    rename_column :trunks, :species_id, :kind_id
  end

  def self.down
    rename_column :trunks, :kind_id, :species_id
  end
end
