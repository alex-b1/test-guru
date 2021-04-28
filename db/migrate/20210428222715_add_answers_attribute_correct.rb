class AddAnswersAttributeCorrect < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :correct, :integer, null: false
  end
end
