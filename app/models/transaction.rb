class Transaction < ApplicationRecord
  belongs_to :user
  # belongs_to :goal

  validates :transaction_amount, presence: true

  # method to calculate the rouded-up value

  def next_value
    @transction = Transaction.transaction_amount
    if @transaction.positive?
      next_integer = @transaction.ceil
      value_added = next_integer - @transaction
    else
      next_integer = @transaction.floor
      value_added = @transaction - next_integer
    end
    return [value_added.round(2), next_integer]
  end
end
