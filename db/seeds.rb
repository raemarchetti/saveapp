# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# ...

user = User.first

credit_card_data = {
  card_number: Faker::Stripe.valid_card,
  card_holder_name: user.name,
  expiration_date: Faker::Date.between(from: Date.today, to: 10.years.from_now).strftime('%m/%y'),
  cvv: Faker::Stripe.ccv
}

credit_card = user.credit_cards.create(credit_card_data)
