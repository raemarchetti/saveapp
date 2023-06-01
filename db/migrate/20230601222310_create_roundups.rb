class CreateRoundups < ActiveRecord::Migration[7.0]
  def change
    create_table :roundups do |t|
      t.decimal :roundup_amount
      t.decimal :transaction_amount
      t.decimal :transaction_ceil
      t.references :transaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
