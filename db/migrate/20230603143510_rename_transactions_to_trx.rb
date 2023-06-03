class RenameTransactionsToTrx < ActiveRecord::Migration[7.0]
  def change
    rename_table :transactions, :operations
  end
end
