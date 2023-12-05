# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@customer_1 = Customer.create!(name: "Larry", subscribed: true, income: 100)

@order_1 = @customer_1.orders.create!(item_name: "steamdeck", shipped: true, model: 1)
@order_2 = Order.create!(item_name: "switch", shipped: false, model: 5, customer_id: @customer_1.id)