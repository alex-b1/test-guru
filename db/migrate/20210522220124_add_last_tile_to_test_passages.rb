class AddLastTileToTestPassages < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :last_time, :string

  end
end
