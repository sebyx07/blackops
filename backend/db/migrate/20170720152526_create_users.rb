class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.integer :role

      t.timestamps
    end
    add_index :users, :username, unique: true
    User.create(username: 'System', password: '1234', role: :admin)
  end
end
