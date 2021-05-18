class AddIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :answers, %i[title correct], unique: true
    add_index :categories, :title
    add_index :test_passages, :correct_questions
  end
end
