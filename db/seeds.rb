# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

RentalProperty.delete_all

user = User.create!(username: "user", email: "user@email.com", password: "password")
user.rental_properties.create(title: "Conans Gym", description: "We are a traditional gym located in Syracuse Ny. We have appoximatly 125 people a day", price: 25, address: "911 N Salina St, Syracuse, NY 13208", email:"scopani3393@hotmail.com", industry: "Health/fitness", latitude: 43.063240, longitude: -76.155710)
user.rental_properties.create(title: "Flight Room Fitness", industry: "Health/fitness", description: "High end cross training facility with around 200 active daily members.", price: 75, address: "333 Pulaski St, Syracuse, NY 13204", email:"FlightRoomSyracuse@gmail.com", latitude: 43.059960, longitude: -76.173920)
user.rental_properties.create(title: "Hercules Gym", industry: "Health/fitness", description: "24 hour power lifting gym", price: 30, address: "6361 Thompson Rd, Syracuse, NY 13206", email: "Knutsen.pete@gmail.com", latitude: 43.078410, longitude: -76.090570)
user.rental_properties.create(title: "Metro Fitness", industry: "Health/fitness", description: "High end fitness establishment with over 200 customers a day", price: 125, address: "205 S Salina St #1a, Syracuse, NY 13202", latitude: 43.049150, longitude: -76.151980)
