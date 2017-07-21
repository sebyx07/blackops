class AddSessionToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :session, :string
    add_index :users, :session
  end
end
