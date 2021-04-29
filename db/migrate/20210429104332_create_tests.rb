class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, :null => :false
      t.integer :level, :null => :false, :default => 1
      t.integer :category_id, foreign_key: { to_table: :categories }, index: { unique: true}

      t.timestamps
    end
  end
end
