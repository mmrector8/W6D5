# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

morgan = Cat.create!({birth_date: '1996/07/10', name: "morgan", sex: 'F', color: 'silver', description: 'cuddly and fun'})
bacheeva = Cat.create!({birth_date: '1999/07/10', name: "bacheeva", sex: 'F', color: 'black', description: 'cuddly and fun'})
shaye = Cat.create!({birth_date: '1999/07/10', name: "shaye", sex: 'F', color: 'silver', description: 'sassy and fun'})