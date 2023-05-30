class RemoveColumnGoalIdFromTransactions < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :goal_id, :bigint
  end
end
