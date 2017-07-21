class CreateWsSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :ws_sessions, id: false do |t|
      t.string :id, primary: true
      t.uuid :user_id
      t.references :ws_server, foreign_key: true
      t.string :channel
      t.boolean :room

      t.timestamps
    end

    add_index :ws_sessions, :user_id
    add_index :ws_sessions, :channel
  end
end
