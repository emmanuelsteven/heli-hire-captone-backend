# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
helicopters_data = [
  { name: 'Harley', description: 'light plane', contact: '@airbus.ng', price: 300, carriage_capacity: 32, model: 322, image: 'https://image.kilimall.com/kenya/shop/store/goods/7442/2021/07/7442_06801939004978952_720.jpg.webp' },
  { name: 'jamesco', description: 'light plane', contact: '@airbus.ng', price: 300, carriage_capacity: 32, model: 322, image: 'https://image.kilimall.com/kenya/shop/store/goods/7442/2021/07/7442_06801939004978952_720.jpg.webp' },
  ]
  helicopters_data.each do |helicopter_data|
    Helicopter.create(helicopter_data)
  end
  
  puts "heli created successfully."