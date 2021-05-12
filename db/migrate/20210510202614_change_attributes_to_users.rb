class ChangeAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :role, :type
    rename_column :users, :name, :first_name
    add_column :users, :last_name, :string
    add_index :users, :type
    change_column :users, :type, :string, default: 'User'
  end
end
