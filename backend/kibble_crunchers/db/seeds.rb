# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PetFood.destroy_all
Food.destroy_all
Pet.destroy_all

# high_prairie = Food.create(brand: "Taste of the Wild", name:"High Prairie", expiration_date: "2019-12-10", amount: 14)
pacific_stream = Food.create(brand: "Taste of the Wild", name:"Pacific Stream", expiration_date: "2020-10-10", amount: 28)
# sierra_mountain = Food.create(brand: "Taste of the Wild", name:"Sierra Mountain", expiration_date: "2020-06-26", amount: 28)
# wetlands = Food.create(brand: "Taste of the Wild", name:"Wetlands", expiration_date: "2019-12-10", amount: 14)
# rocky_mountain = Food.create(brand: "Taste of the Wild", name:"Rocky Mountain", expiration_date: "2019-11-10", amount: 5) #for cats
# canyon_river = Food.create(brand: "Taste of the Wild", name:"Canyon River", expiration_date: "2021-11-10", amount: 14) #for cats
# farm_raise_chicken = Food.create(brand: "Nutro", name:"Wholesome Essentials Large Breed Adult Farm Raised Chicken", expiration_date: "2019-11-30", amount: 30)
# lamb_and_rice = Food.create(brand: "Nutro", name:"Wholesome Essentials Large Breed Adult Lamb & Rice Recipe Dry Dog Food", expiration_date: "2020-12-10", amount: 30)
# wilderness_chicken = Food.create(brand: "Blue Buffalo", name:"Wilderness Chicken", expiration_date: "2021-01-10", amount: 24)
wilderness_salmon = Food.create(brand: "Blue Buffalo", name:"Wilderness Salmon", expiration_date: "2021-05-20", amount: 24)
# chicken = Food.create(brand: "Blue Buffalo", name:"Wilderness Chicken", expiration_date: "2021-07-19", amount: 12) #for cats
wilderness_duck = Food.create(brand: "Blue Buffalo", name:"Wilderness Duck", expiration_date: "2020-02-20", amount: 5) #for cats

breezy = Pet.create(name: "Breezy", breed: "Long hair black cat", birth_date: "2018-06-29", animaltype: "Cat", user_id: 1)
# bixby = Pet.create(name: "Bixby", breed: "German Shepard/Chow mix", birth_date: "2010-01-31", animaltype: "Dog")
whiskey = Pet.create(name: "Whiskey", breed: "Corgi mix", birth_date: "2017-09-15", animaltype: "Dog", user_id: 1)
# ted = Pet.create(name: "Ted", breed: "Beagle/Spaniel mix", birth_date: "2013-10-10", animaltype: "Dog")

PetFood.create(pet: whiskey,food: pacific_stream)
PetFood.create(pet: whiskey,food: wilderness_salmon)
PetFood.create(pet: breezy,food: wilderness_duck)
# PetFood.create(pet: bixby, food: wilderness_chicken)
# PetFood.create(pet: ted,food: lamb_and_rice)

