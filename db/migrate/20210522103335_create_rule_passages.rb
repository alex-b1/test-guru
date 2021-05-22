class CreateRulePassages < ActiveRecord::Migration[6.1]
  def change
    create_table :rule_passages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :rule, null: false, foreign_key: true
      t.boolean :passed, null: false, default: false

      t.timestamps
    end
  end
end
