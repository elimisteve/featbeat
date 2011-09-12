class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.column :count,  :integer
      t.column :unit,   :string, :limit => 255
      t.column :noun,   :string, :limit => 255
      t.column :verb,   :string, :limit => 255
      t.column :data,   :string, :limit => 1024
      t.timestamps
    end
  end

  def self.down
  end
end
