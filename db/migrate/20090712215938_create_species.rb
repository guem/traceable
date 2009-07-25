class CreateSpecies < ActiveRecord::Migration
  def self.up
    create_table :species do |t|
      t.string :scientific
      t.string :portugues
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :species
  end
end
