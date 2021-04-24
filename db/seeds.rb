# frozen_string_literal: true

puts 'CLEAN the DB'
Restaurant.destroy_all

puts 'Creating one restaurant'
Restaurant.create!(
  name: 'Dishoom',
  address: 'London (close to LW)',
  category: 'italian',
  phone_number: '123456789'
)

puts "We have in the DATABASE #{Restaurant.count} restaurants"

puts 'Creating reviews'

3.times do |x|
  Review.create!(
    content: "I loved it! I went there #{x + 1} times",
    rating: rand(0..5),
    restaurant: Restaurant.first
  )
end

puts "We have in the DATABASE #{Review.count} reviews"

puts 'We are good to go!'
