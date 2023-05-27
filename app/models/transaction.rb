class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :goal

  # method to calculate the rouded-up value

  def next_value
    if @transaction_amount.positive?
      next_integer = @transaction_amount.ceil
      value_added = next_integer - @transaction_amount
    elsif @transaction_amount.negative?
      next_integer = @transaction_amount.floor
      value_added = @transaction_amount - next_integer
    else
      return [0, 1]
    end
    return [value_added.round(2), next_integer]
  end
end
