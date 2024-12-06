# require 'json'

# OrderItem.delete_all
# Order.delete_all
# Customer.delete_all
# Review.delete_all
# LegoSet.delete_all



# file_path = Rails.root.join('db', 'lego-sets.json')
# lego_sets_data = JSON.parse(File.read(file_path))

# lego_sets_data.first(110).each do |set_data|
#   LegoSet.create!(
#     set_id: set_data['SetID'],
#     title: set_data['Title'],
#     image: set_data['Image'],
#     price: rand(20.00..100.00).round(2),
#     description: Faker::Lorem.sentence(word_count: 15),
#     category: %w[adult child].sample
#   )
# end

# puts "Seeded 100 Lego sets with random prices, descriptions, and categories."

# StaticPage.find_or_create_by!(slug: "about") do |page|
#   page.title = "About Us"
#   page.content = "Welcome to Bricktown! Here’s more about us."
# end

# StaticPage.find_or_create_by!(slug: "contact") do |page|
#   page.title = "Contact Us"
#   page.content = "Feel free to contact us at contact@bricktown.com."
# end


##################################################################
# New Seeds for re-seed

# require 'json'

# OrderItem.delete_all
# Order.delete_all
# Customer.delete_all
# Review.delete_all
# LegoSet.delete_all

# child_category = Category.find_or_create_by!(name: "Child")
# adult_category = Category.find_or_create_by!(name: "Adult")


# file_path = Rails.root.join('db', 'lego-sets.json')
# lego_sets_data = JSON.parse(File.read(file_path))

# lego_sets_data.first(120).each do |set_data|
#   LegoSet.create!(
#     set_id: set_data['SetID'],
#     title: set_data['Title'],
#     image: set_data['Image'],
#     price: rand(20.00..100.00).round(2),
#     category: [child_category, adult_category].sample
#   )
# end

# puts "Seeded 120 Lego sets with random prices and categories."
#####################################################################
user = User.first

5.times do |i|
  order = user.orders.create!(
    total_price: rand(50..200),
    status: "pending",
    address: "123 Example Street",
    province: "MB",
    taxes: rand(5..20)
  )

  lego_set = LegoSet.first
  order.order_items.create!(
    lego_set: lego_set,
    quantity: rand(1..3),
    price_at_purchase: lego_set.price
  )
end

puts "5 orders created for User: #{user.email}"