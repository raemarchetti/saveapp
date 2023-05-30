class RemoveUserFromTransaction < ActiveRecord::Migration[7.0]
  def change
    remove_reference :transactions, :user, index: true, foreign_key: true
    add_reference :transactions, :credit_card, index: true, foreign_key: true
  end
end
