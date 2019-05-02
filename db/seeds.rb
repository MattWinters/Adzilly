# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

RentalProperty.delete_all
User.delete_all

user = User.create!(username: "user", email: "user@email.com", password: "password")
conans = user.rental_properties.create(title: "Conans Gym", description: "We are a traditional gym located in Syracuse Ny. We have appoximatly 125 people a day", price: 25, address: "911 N Salina St, Syracuse, NY 13208", email:"scopani3393@hotmail.com", industry: "Health/fitness", latitude: 43.063240, longitude: -76.155710)
conans.images.attach(io: File.open("app/assets/images/seed-photos/conans/_DSC0845.jpg"), filename: '-DSC0845.jpg', content_type: 'jpg')
conans.images.attach(io: File.open("app/assets/images/seed-photos/conans/_DSC0847.jpg"), filename: '_DSC0847.jpg', content_type: 'jpg')
conans.images.attach(io: File.open("app/assets/images/seed-photos/conans/_DSC0848.jpg"), filename: '_DSC0848.jpg', content_type: 'jpg')


fr = RentalProperty.create!(title: "Flight Room Fitness", industry: "Health/fitness", description: "High end cross training facility with around 200 active daily members.", price: 75, address: "333 Pulaski St, Syracuse, NY 13204", email:"FlightRoomSyracuse@gmail.com", latitude: 43.059960, longitude: -76.173920, user_id: user.id)
fr.images.attach(io: File.open("app/assets/images/seed-photos/flightRoom/IMG_3369.JPG"), filename: 'IMG_3369.JPG', content_type: 'jpg')
fr.images.attach(io: File.open("app/assets/images/seed-photos/flightRoom/IMG_3352.JPG"), filename: 'IMG_3352.JPG', content_type: 'jpg')
fr.images.attach(io: File.open("app/assets/images/seed-photos/flightRoom/IMG_3355.JPG"), filename: 'IMG_3355.JPG', content_type: 'jpg')


swet = RentalProperty.create!(title: "Sweat by Flight Room", industry: "Health/fitness", description: "New Spin Studio located in downtown Syracuse.", price: 75, address: "333 Pulaski St, Syracuse, NY 13204", email:"FlightRoomSyracuse@gmail.com", latitude: 43.059960, longitude: -76.173920, user_id: user.id)
swet.images.attach(io: File.open("app/assets/images/seed-photos/flightRoom/IMG_3357.JPG"), filename: 'IMG_3357.JPG', content_type: 'jpg')
swet.images.attach(io: File.open("app/assets/images/seed-photos/flightRoom/IMG_3368.JPG"), filename: 'IMG_3368.JPG', content_type: 'jpg')

hercules = user.rental_properties.create(title: "Hercules Gym", industry: "Health/fitness", description: "24 hour power lifting gym", price: 30, address: "6361 Thompson Rd, Syracuse, NY 13206", email: "Knutsen.pete@gmail.com", latitude: 43.078410, longitude: -76.090570)
hercules.images.attach(io: File.open("app/assets/images/seed-photos/hercules/Hercules.jpg"), filename: 'Hercules.jpg', content_type: 'jpg')
hercules.images.attach(io: File.open("app/assets/images/seed-photos/hercules/h1.jpg"), filename: 'h1.jpg', content_type: 'jpg')
hercules.images.attach(io: File.open("app/assets/images/seed-photos/hercules/h2.jpg"), filename: 'h2.jpg', content_type: 'jpg')
hercules.images.attach(io: File.open("app/assets/images/seed-photos/hercules/h3.jpg"), filename: 'h3.jpg', content_type: 'jpg')


metro = user.rental_properties.create(title: "Metro Fitness", industry: "Health/fitness", description: "High end fitness establishment with over 200 customers a day", price:70, address: "205 S Salina St #1a, Syracuse, NY 13202", latitude: 43.049150, longitude: -76.151980)
metro.images.attach(io: File.open("app/assets/images/seed-photos/metro/metro1.jpg"), filename: 'metro1.jpg', content_type: 'jpg')
metro.images.attach(io: File.open("app/assets/images/seed-photos/metro/metro2.jpg"), filename: 'metro2.jpg', content_type: 'jpg')
metro.images.attach(io: File.open("app/assets/images/seed-photos/metro/metro3.jpg"), filename: 'metro3.jpg', content_type: 'jpg')
metro.images.attach(io: File.open("app/assets/images/seed-photos/metro/metro4.jpg"), filename: 'metro4.jpg', content_type: 'jpg')

absolute = RentalProperty.create!(title: "Absolute Performance Training", industry: "Health/fitness", description: "Sports performance gym. We have clients ranging from 8-65 years old. Largest portion are middle aged women and men. Also high school and college athletes.", price: 75, address: "5 Plain Av, New Rochelle, NY 10801", email:"Andrew@absolute.com", latitude: 40.928091, longitude: -73.771663, user_id: user.id)
absolute.images.attach(io: File.open("app/assets/images/seed-photos/cross/abs.jpg"), filename: 'abs.jpg', content_type: 'jpg')
absolute.images.attach(io: File.open("app/assets/images/seed-photos/cross/abs2.jpg"), filename: 'abs2.jpg', content_type: 'jpg')
absolute.images.attach(io: File.open("app/assets/images/seed-photos/cross/abs3.jpg"), filename: 'abs3.jpg', content_type: 'jpg')


crossfit = RentalProperty.create!(title: "Crossfit Result", industry: "Health/fitness", description: "We are a fully certified Cross Fit gym located in Westchester county. Our members range from 20 - 60 years old. The majority of our members are between 20 and 30", price: 80, address: "5 Plain Av, New Rochelle, NY 10801", email:"Sheaw@crossfitresult.com", latitude: 40.928091, longitude: -73.771663, user_id: user.id)
crossfit.images.attach(io: File.open("app/assets/images/seed-photos/absolute/IMG-3486"), filename: 'IMG-3486.PNG', content_type: 'png')
crossfit.images.attach(io: File.open("app/assets/images/seed-photos/absolute/IMG-3488.png"), filename: 'IMG-3488.PNG', content_type: 'png')
crossfit.images.attach(io: File.open("app/assets/images/seed-photos/absolute/IMG-3489.png"), filename: 'IMG-3489.PNG', content_type: 'png')
