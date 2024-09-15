class AddCaloriesBurnedToLogs < ActiveRecord::Migration[7.0]
  def change
    add_column :logs, :calories_burned, :float
  end
end
