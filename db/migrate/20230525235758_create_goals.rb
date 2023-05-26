class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :goal_amount
      t.decimal :goal_balance
      t.string :goal_name

      t.timestamps
    end
  end
end
