class CreateProcessTrunks < ActiveRecord::Migration
  def self.up
    create_table :process_trunks do |t|
      t.integer :trunk_id
      t.datetime :date
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :process_trunks
  end
end
