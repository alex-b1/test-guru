class AddIndexes < ActiveRecord::Migration[6.1]
  def change
    add_inde :answers, %i[title correct], unique: true
    add_inde :categories, :title
    add_inde :test_passages, :correct_questions
  end
end
