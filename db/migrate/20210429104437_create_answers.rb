class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :title, :null => :false
      t.boolean :correct, :null => :false, :default => false

      t.integer :question_id, foreign_key: { to_table: :questions }, index: { unique: true}
      t.timestamps
    end
  end
end
