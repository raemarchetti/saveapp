class Transaction < ApplicationRecord
  belongs_to :user
  # belongs_to :goal

  validates :transaction_amount, presence: true

  # method to calculate the rouded-up value

  def next_value(value)

    if value.positive?
      next_integer = value.ceil
      value_added = next_integer - value
    else
      next_integer = value.floor
      value_added = value - next_integer
    end
    return [value_added.round(2), next_integer]
  end
end
