class AddTestsAttributeCategoryId < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :category_id, :integer, null: false
  end
end
