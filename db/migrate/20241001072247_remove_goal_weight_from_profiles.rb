class RemoveGoalWeightFromProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :goal_weight


    add_column :weights, :goal_weight, :float
  end
end
