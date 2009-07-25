class CreateTrunks < ActiveRecord::Migration
  def self.up
    create_table :trunks do |t|
      t.string :traceable, :limit => 8
      # t.string :species - nicht notwendig, weil wg. belongs_to :species definiert
      t.string :location
      t.decimal :volume
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :trunks
  end
end
