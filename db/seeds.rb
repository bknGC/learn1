# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

c1 = Category.create({name: "Food"})
c1 = Category.create({name: "Drink"})

c1.products.create({name: "Bread", price: 1.5})
c1.products.create({name: "Butter", price: 2.5})
c1.products.create({name: "HUY", price: 1.75})
c2.products.create({name: "PISKA", price: 2.75})
c2.products.create({name: "BLYA BESIT PIZDEC", price: 3.75})
c2.products.create({name: "NASTYA BLYAT", price: 35.75})