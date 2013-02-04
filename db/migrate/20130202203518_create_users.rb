class CreateUsers < ActiveRecord::Migration
  def up
     create_table :users do |t|
      t.column :entity, "text"
      t.column :app_id, "text"
      t.column :app_mac, "text", :default => "{}"
      t.column :profile, "text", :default => "{}"
      t.column :mac_key_id, "text"
      t.column :mac_key, "text"
      t.column :mac_algorithm, "text"
      t.column :profile_info_types, "text[]", :default=>"{}"
      t.column :post_types, "text[]", :default=>"{}"
      t.timestamps
    end
  end

  def down
  end
end
