class AddAnswersDefaultCorrectValue < ActiveRecord::Migration[6.1]
  def change
    change_column :answers, :correct, :integer, :default => 0
  end
end
