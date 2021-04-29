class AddAnswersAttributeQuestionId < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :question_id, :integer, null: false
  end
end
