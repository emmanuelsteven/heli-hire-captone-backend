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

    { name: 'Bells Helicopter', description: 'meduim utility offshore Heilo', contact: 'www.@Bells.ng', price: 15000, carriage_capacity: '10', model: 'N62ZA', image: 'https://img.freepik.com/premium-photo/helicopter-copter-chopper-helicopter-white-background_939542-16.jpg' },

    { name: 'Yellow heli', description: 'A helicopter is a type of aircraft that uses rotating', contact: 'www.@Bells.ng', price: 15000, carriage_capacity: '10', model: 'N62ZA', image: 'https://img.freepik.com/premium-photo/yellow-helicopter-isolated-white-background-3d-illustration_101266-15201.jpg?w=2000' },

    { name: 'Green Heli', description: 'A helicopter is a type of aircraft that uses rotating', contact: 'www.@Bells.ng', price: 15000, carriage_capacity: '10', model: 'N62ZA', image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/HAL_Prachand_%28ZF_4834%29.jpg/1200px-HAL_Prachand_%28ZF_4834%29.jpg' },

    { name: 'Tonka heli', description: 'A helicopter is a type of aircraft that uses rotating', contact: 'www.@Bells.ng', price: 15000, carriage_capacity: '10', model: 'N62ZA', image: 'https://i5.walmartimages.com/seo/Tonka-Light-Sound-Helicopter-Police_08626656-44ae-47af-b34b-77dfb57b4e60_1.3f176eb2821ea2081dab4b221d01fe19.jpeg?odnHeight=2000&odnWidth=2000&odnBg=FFFFFF' },

    { name: 'Black Perl', description: 'meduim utility offshore Heilo', contact: 'www.@Bells.ng', price: 15000, carriage_capacity: '10', model: 'N62ZA', image: 'https://media.gettyimages.com/id/182777917/photo/close-up-of-a-black-military-helicopter.jpg?s=612x612&w=0&k=20&c=eCNB0cSZ7MOpBg7WeXa-Idimyl9-CeMGu2Gsyb1_8D8=' },

    { name: 'Airbus Helicopter', description: 'small utility Tour Cruise Helicopter', contact: 'www.EC@airbus.ng', price: 7000, carriage_capacity: '4', model: 'N703CC', image: 'https://media.istockphoto.com/id/909882348/photo/front-view-helicopter-isolated.jpg?s=612x612&w=0&k=20&c=kgyhj2NbYy_W19fyeu7QC5r_6plsxdCJxlejAp-Vjd0=' },

]

heli_data.each do |heli_data|
  Helicopter.create(heli_data)
end

puts "Helicopter created successfully"

 
 
