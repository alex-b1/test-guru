class AddAnswersAttributesNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:answers, :title, false)
  end
end
