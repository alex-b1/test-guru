class AddUsersAttributesNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:users, :name, false)
    change_column_null(:users, :type, false)
  end
end
