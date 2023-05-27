class Goal < ApplicationRecord
  belongs_to :user
  validates :goal_name, :goal_amount, presence: true
end
