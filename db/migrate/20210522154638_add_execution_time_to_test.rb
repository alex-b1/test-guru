class AddExecutionTimeToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :execution_time, :int
  end
end
