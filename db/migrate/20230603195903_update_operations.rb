class UpdateOperations < ActiveRecord::Migration[7.0]
  def change
    rename_column :operations, :transaction_amount, :operation_amount
    rename_column :operations, :transaction_date, :operation_date
    rename_column :operations, :transaction_origin, :operation_origin

    add_column :operations, :operation_ceil, :decimal
    add_column :operations, :roundup_amount, :decimal

    add_reference :operations, :goal, foreign_key: true
  end
end
