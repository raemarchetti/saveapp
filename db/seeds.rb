# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# ...
require 'faker'
Transaction.destroy_all
CreditCard.destroy_all
User.destroy_all

admin = User.create!(
  email: "test@admin.test",
  password: 'password',
  name: 'Jane Doe',
  address: Faker::Address.unique.full_address,
  phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164
)

user = User.create!(
  email: Faker::Internet.email,
  password: 'password',
  name: Faker::Name.name,
  address: Faker::Address.unique.full_address,
  phone_number: Faker::PhoneNumber.unique.cell_phone_in_e164
)

credit_card = CreditCard.create!(
  card_number: Faker::Stripe.valid_card,
  card_holder_name: user.name,
  expiration_date: Faker::Date.between(from: Date.today, to: 10.years.from_now).strftime('%m/%y'),
  cvv: Faker::Stripe.ccv,
  user_id: user.id
  )



10.times do
  transaction = Transaction.create!(
   user: User.first,
   transaction_amount: Faker::Commerce.price(range: 10.0..100.0),
   transaction_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
   transaction_origin: Faker::Company.name,
   goal: goal.goal_name,
   user_id: user.id
 )
end
