class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
    t.references :user, null: false, foreign_key: true
    t.float :height, presence: true
    t.float :weight, presence: true
    t.float :goal_weight

      t.timestamps
    end
  end
end
