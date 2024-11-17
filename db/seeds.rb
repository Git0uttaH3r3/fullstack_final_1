require 'json'

OrderItem.delete_all
Order.delete_all
Customer.delete_all

Review.delete_all
LegoSet.delete_all



file_path = Rails.root.join('db', 'lego-sets.json')
lego_sets_data = JSON.parse(File.read(file_path))

lego_sets_data.first(100).each do |set_data|
  LegoSet.create!(
    set_id: set_data['SetID'],
    title: set_data['Title'],
    image: set_data['Image'],
    price: rand(20.00..100.00).round(2),
    description: Faker::Lorem.sentence(word_count: 15),
    category: %w[adult child].sample
  )
end

puts "Seeded 100 Lego sets with random prices, descriptions, and categories."
