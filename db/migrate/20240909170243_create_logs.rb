class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.references :user,     null: false,foreign_key: true
      t.date :date,           null: false
      t.integer :reps
      t.integer :duration,    null: false
      t.text   :memo
      t.string :name, null: false

      t.timestamps
    end
  end
end
