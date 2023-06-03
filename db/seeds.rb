if Rails.env.development?

  # # # <<Clear database>>
Operation.destroy_all
CreditCard.destroy_all
Goal.destroy_all
User.destroy_all

    # # # <<Create a standard user, with pre-set credentials>>
user = User.create!(
  email: "test@admin.test",
  password: 'password',
  name: 'Jane Doe',
  address: Faker::Address.unique.full_address,
  phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164
)

# # # <<Create a random user>>
# # # user = User.create!(
# # #   email: Faker::Internet.email,
# # #   password: 'password',

# # #   phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164
# #  )

# credit_card = CreditCard.create!(
#   card_number: Faker::Stripe.valid_card,
#   card_holder_name: user.name,
#   expiration_date: Faker::Date.between(from: Date.today, to: 10.years.from_now).strftime('%m/%y'),
#   cvv: Faker::Stripe.ccv,
#   user_id: user.id
#   )
# # # <<Create a credit card for our seed user>>
  credit_card = CreditCard.create!(
    card_number: Faker::Stripe.valid_card,
    card_holder_name: "Jane Doe",
    expiration_date: Faker::Date.between(from: Date.today, to: 10.years.from_now).strftime('%m/%y'),
    cvv: Faker::Stripe.ccv,
    user_id: user.id
    )

# # # <<Create goals with pre-set parameters>>
# goal = [
#    Goal.create!(goal_name: 'travel', user: user, goal_amount: Faker::Number.between(from: 200.0, to: 3000.0), goal_balance: 0)
# ]

# 10.times do
#   transaction = Transaction.create!(
#   user: User.first,
#   transaction_amount: Faker::Commerce.price(range: 10.1..299.99),
#   transaction_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
#   transaction_origin: Faker::Company.name
#   # goal_id: Goal.first.id
# )
# end
# # # <<Create transactions with pre-set parameters>>
  transaction = Operation.create!(
    transaction_amount: 68.50,
    transaction_date: Date.today,
    transaction_origin: 'Zara',
    credit_card_id: credit_card.id
  )

  transaction = Operation.create!(
    transaction_amount: 25.15,
    transaction_date: Date.today - 1,
    transaction_origin: 'Netflix',
    credit_card_id: credit_card.id
  )

  transaction = Operation.create!(
    transaction_amount: 15.10,
    transaction_date: Date.today - 1,
    transaction_origin: 'Teddy`s Bar',
    credit_card_id: credit_card.id
  )

  transaction = Operation.create!(
    transaction_amount: 188.18,
    transaction_date: Date.today - 2,
    transaction_origin: 'Leroy Merlin',
    credit_card_id: credit_card.id
  )

  # # # <<Create transactions with Faker gem>>
  10.times do
    transaction = Operation.create!(
    transaction_amount: Faker::Commerce.price(range: 10.1..299.99),
    transaction_date: Faker::Date.between(from: 1.week.ago, to: Date.today),
    transaction_origin: Faker::Company.name,
    credit_card_id: credit_card.id
    # goal_id: Goal.first.id
  )
  end
end
