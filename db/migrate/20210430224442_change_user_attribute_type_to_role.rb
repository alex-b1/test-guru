class ChangeUserAttributeTypeToRole < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :string, null: false
    remove_column :users, :type, :string
  end
end
