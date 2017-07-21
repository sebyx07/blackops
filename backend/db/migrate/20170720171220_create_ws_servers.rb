class CreateWsServers < ActiveRecord::Migration[5.1]
  def change
    create_table :ws_servers do |t|
      t.string :name
      t.string :family
      t.integer :connections, default: 0
      t.boolean :online, default: false
    end

    add_index :ws_servers, :family
    add_index :ws_servers, :name, unique: true
    add_index :ws_servers, :online
  end
end
