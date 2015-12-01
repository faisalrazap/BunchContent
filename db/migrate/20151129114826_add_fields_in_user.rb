class AddFieldsInUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, limit: 30
    add_column :users, :last_name, :string, limit: 30
    add_column :users, :active, :boolean, default: true
    add_column :users, :locked, :boolean, default: false
    add_column :users, :role, :string, limit: 30

    add_index :users, :active
    add_index :users, :locked
    add_index :users, :role
  end
end
