# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

LegoSet.delete_all

require 'json'


file_path = Rails.root.join('db', 'lego_sets.json')
lego_sets_data = JSON.parse(File.read(file_path))

# Limit to 100 sets and attach a random price
lego_sets_data.first(100).each do |set_data|
  LegoSet.create!(
    set_id: set_data['SetID'],
    title: set_data['Title'],
    image: set_data['Image'],
    price: rand(20.00..100.00).round(2)
  )
end

puts "Seeded 100 Lego sets with random prices."
