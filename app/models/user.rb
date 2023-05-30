class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :credit_cards
  has_many :transactions

  after_create :create_initial_transactions

  private

  def create_initial_transactions
    10.times do
      transaction = transactions.build(
        transaction_amount: Faker::Number.between(from: 10, to: 100),
        transaction_origin: Faker::Company.name,
        transaction_date: Faker::Date.between(from: 1.year.ago, to: Date.today)
      )
      transaction.save
    end
  end

end
