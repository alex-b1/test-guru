class SetQuestionsAttributes < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :body, :string, null: false
    add_column :questions, :test_id, :integer, null: false
    remove_column :questions, :title
  end
end
