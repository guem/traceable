class AddInfolinkToKind < ActiveRecord::Migration
  def self.up
    add_column :kinds, :infolink, :string
  end

  def self.down
    remove_column :kinds, :infolink
  end
end
