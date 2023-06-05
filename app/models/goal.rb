class Goal < ApplicationRecord
  belongs_to :user

  has_many :operations
  validates :goal_name, :goal_amount, presence: true
end
