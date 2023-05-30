class Transaction < ApplicationRecord
  belongs_to :credit_card

  def next_value
    @value = self.transaction_amount
    if @value > 0
      next_integer = @value.ceil
      value_added = next_integer - @value
    else
      next_integer = @value.floor
      value_added = @value - next_integer
    end
    return [value_added.round(2), next_integer]
  end


  validates :transaction_amount, presence: true
end
