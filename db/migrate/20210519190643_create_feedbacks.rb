class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :email, null: false
      t.string :comment, null: false

      t.timestamps
    end
  end
end
