class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :body, :null => :false
      t.integer :test_id, foreign_key: { to_table: :tests }, index: { unique: true}

      t.timestamps
    end
  end
end
