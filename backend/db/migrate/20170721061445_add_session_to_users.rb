class AddSessionToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :session, :string
    add_column :users, :last_seen, :datetime
    add_index :users, :session
    add_index :users, :last_seen
  end
end
