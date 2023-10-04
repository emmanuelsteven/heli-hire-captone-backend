# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

heli_data = [
    { name: 'Airbus Helicopter', description: 'meduim utility medical Helicopter', contact: 'www.H160@airbus.ng', price: 3000, carriage_capacity: '9', model: 'H160', image: 'https://st2.depositphotos.com/3562409/9102/i/450/depositphotos_91028268-stock-photo-helicopter-isolated-on-white-background.jpg' },

    { name: 'Airbus Helicopter', description: 'small utility Tour Cruise Helicopter', contact: 'www.EC@airbus.ng', price: 7000, carriage_capacity: '4', model: 'N703CC', image: 'https://media.istockphoto.com/id/909882348/photo/front-view-helicopter-isolated.jpg?s=612x612&w=0&k=20&c=kgyhj2NbYy_W19fyeu7QC5r_6plsxdCJxlejAp-Vjd0=' },

    { name: 'Bells Helicopter', description: 'meduim utility offshore Heilo', contact: 'www.@Bells.ng', price: 15000, carriage_capacity: '10', model: 'N62ZA', image: 'https://img.freepik.com/premium-photo/helicopter-copter-chopper-helicopter-white-background_939542-16.jpg' }
]

heli_data.each do |heli_data|
  Helicopter.create(heli_data)
end

puts "Helicopter created successfully"

 
 
