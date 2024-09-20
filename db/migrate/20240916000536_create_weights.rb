class CreateWeights < ActiveRecord::Migration[7.0]
  def change
    create_table :weights do |t|
      t.float :weight,null: false
      t.date :date,null: false
      t.references :user,     null: false,foreign_key: true





      t.timestamps
    end
  end
end
