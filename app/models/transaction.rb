class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :goal

  # method to calculate the rouded-up value

  def next_value(value)
    if value.positive?
      next_integer = value.ceil
      value_added = next_integer - value
    elsif value.negative?
      next_integer = value.floor
      value_added = value - next_integer
    else
      return [0, 1]
    end
    return [value_added.round(2), next_integer]
  end
end
