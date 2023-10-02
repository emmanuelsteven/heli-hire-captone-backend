# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

heli_data = [
    { name: 'Airbus Helicopter', description:'meduim utility medical Helicopter', contact: 'www.H160@airbus.ng' price: 3000 , carriage_capacity: '9', model: 'H160',image: 'https://images.unsplash.com/photo-1586097494908-6dbb35137167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3270&q=80' }

    { name: 'Airbus Helicopter', description:'small utility Tour Cruise Helicopter', contact: 'www.EC@airbus.ng' price: 7000 , carriage_capacity: '4', model: 'N703CC',image: 'https://images.unsplash.com/photo-1579118559062-39e94a22dbb8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3424&q=80' }

    { name: 'AirBus Helicopter', description:'meduim utility Rescue Helicopter', contact: 'www.@airbus.ng' price: 15000 , carriage_capacity: '10', model: 'EC145',image: 'https://www.careersinaerospace.com/wp-content/uploads/2017/06/Eurocopter-Helicopter-Wallpaper-HD.jpg' }

    { name: 'Bells Helicopter', description:'meduim utility offshore Heilo', contact: 'www.@Bells.ng' price: 15000 , carriage_capacity: '10', model: 'N62ZA',image: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/bb/4e/9d.jpg' }
]
 heli_data.each do |heli_data| Helicopter.create(heli_data)
 end
 puts "Helicopter created successfully"

 
