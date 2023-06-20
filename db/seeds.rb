# if Rails.env.development?

  # # # <<Clear database>>
Operation.destroy_all
CreditCard.destroy_all
Goal.destroy_all
User.destroy_all

    # # # <<Create a standard user, with pre-set credentials>>
user = User.create!(
  email: "mari@mail.com",
  password: 'password',
  name: 'Mariana Milani',
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
    card_holder_name: "Mariana Milani",
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

  # # # <<Create a random user>>
  # # # user = User.create!(
  # # #   email: Faker::Internet.email,
  # # #   password: 'password',
  # # #   name: Faker::Name.name,
  # # #   address: Faker::Address.unique.full_address,
  # # #   phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164
  # #  )

  # # # <<Create goals with pre-set parameters>>
  goal =
     Goal.create!(
      goal_name: 'Christmas Gift',
      user: user,
      goal_amount: 100,
      goal_balance: 0
    )

  # # # <<Create transactions with pre-set parameters>>
  operation = Operation.create!(
    operation_amount: 68.50,
    operation_date: Date.today,
    operation_origin: 'Zara',
    operation_ceil: 0,
    roundup_amount: 0,
    credit_card: credit_card,
    goal: goal
  )

  operation = Operation.create!(
    operation_amount: 25.15,
    operation_date: Date.today - 1,
    operation_origin: 'Netflix',
    operation_ceil: 0,
    roundup_amount: 0,
    credit_card: credit_card,
    goal: goal
  )

  operation = Operation.create!(
    operation_amount: 62.10,
    operation_date: Date.today - 1,
    operation_origin: 'Teddy`s Bar',
    operation_ceil: 0,
    roundup_amount: 0,
    credit_card: credit_card,
    goal: goal
  )

  operation = Operation.create!(
    operation_amount: 188.18,
    operation_date: Date.today - 2,
    operation_origin: 'Leroy Merlin',
    operation_ceil: 0,
    roundup_amount: 0,
    credit_card_id: credit_card.id,
    goal: goal
  )

  operation = Operation.create!(
    operation_amount: 21.75,
    operation_date: Date.today - 2,
    operation_origin: 'Mac Donald`s',
    operation_ceil: 0,
    roundup_amount: 0,
    credit_card_id: credit_card.id,
    goal: goal
  )

  operation = Operation.create!(
    operation_amount: 326.25,
    operation_date: Date.today - 2,
    operation_origin: 'Pão de Açucar',
    operation_ceil: 0,
    roundup_amount: 0,
    credit_card_id: credit_card.id,
    goal: goal
  )

  operation = Operation.create!(
    operation_amount: 35.00,
    operation_date: Date.today - 3,
    operation_origin: 'Burguer King',
    operation_ceil: 0,
    roundup_amount: 0,
    credit_card_id: credit_card.id,
    goal: goal
  )

  operation = Operation.create!(
    operation_amount: 199.90,
    operation_date: Date.today - 3,
    operation_origin: 'Droga Raia',
    operation_ceil: 0,
    roundup_amount: 0,
    credit_card_id: credit_card.id,
    goal: goal
  )

  operation = Operation.create!(
    operation_amount: 12.40,
    operation_date: Date.today - 3,
    operation_origin: 'Shopee',
    operation_ceil: 0,
    roundup_amount: 0,
    credit_card_id: credit_card.id,
    goal: goal
  )

  operation = Operation.create!(
    operation_amount: 91.65,
    operation_date: Date.today - 3,
    operation_origin: 'Shein',
    operation_ceil: 0,
    roundup_amount: 0,
    credit_card_id: credit_card.id,
    goal: goal
  )

  # # # <<Create operations with Faker gem>>
  10.times do
    operation = Operation.create!(
    operation_amount: Faker::Commerce.price(range: 10.1..299.99),
    operation_date: Faker::Date.between(from: 1.week.ago, to: Date.today),
    operation_origin: Faker::Company.name,
    operation_ceil: 0,
    roundup_amount: 0,
    credit_card: credit_card,
    goal: goal
  )
  end

