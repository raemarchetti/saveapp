class CreditCard < ApplicationRecord
  belongs_to :user
  has_many :operations, dependent: :destroy

  validates :card_number, presence: true
  validates :expiration_date, presence: true
  validates :cvv, presence: true
end
