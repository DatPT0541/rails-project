class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :string, default: "user", null: false
    add_index :users, :email, unique: true
  end
end
