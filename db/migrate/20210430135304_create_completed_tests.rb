class CreateCompletedTests < ActiveRecord::Migration[6.1]
  def change
    create_table :completed_tests do |t|
      t.boolean :result, null: false, default: false
      t.references :test, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
