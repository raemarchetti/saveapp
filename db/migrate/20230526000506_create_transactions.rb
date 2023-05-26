class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :transaction_amount
      t.date :transaction_date
      t.string :transaction_origin
      t.references :goal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
