# Creating a simple seed to get started

# Run on Terminal: rails db:drop db:create db:migrate db:seed
# so that user_id will match the ID 1

# Starts Here ---
puts 'Seed: Started'

puts 'Seed: Cleaning DB'

User.destroy_all
CreditCard.destroy_all
Goal.destroy_all
Transaction.destroy_all

puts 'Seed: User'

p User

User.create!(
  email: 'user@user.com',
  name: 'john',
  password: '123456',
  address: 'Rua do Amargura 123',
  phone_number: '123456789'
)

puts 'Seed: CreditCard'

CreditCard.create!(
  card_number: '1234123412341234',
  card_holder_name: 'John Doe',
  expiration_date: '01/01/2024',
  cvv: '123',
  user_id: '1'
)

puts 'Seed: Goal'

Goal.create!(
  goal_amount: '10.00',
  goal_balance: '0.00',
  goal_name: 'Traveling',
  user_id: '1'
)

puts 'Seed: Transaction'

Transaction.create!(
  transaction_amount: '5.25',
  transaction_date: '10/10/2023',
  transaction_origin: 'Starbucks',
  goal_id: '1',
  user_id: '1'
)

Transaction.create!(
  transaction_amount: '1.75',
  transaction_date: '10/10/2023',
  transaction_origin: 'CheeseCakeFactory',
  goal_id: '1',
  user_id: '1'
)

Transaction.create!(
  transaction_amount: '8.00',
  transaction_date: '10/10/2023',
  transaction_origin: 'BK',
  goal_id: '1',
  user_id: '1'
)

puts 'Seed: Finished'

# Finish Here ---
