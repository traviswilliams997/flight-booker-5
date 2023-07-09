# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Airport.create(Code: "ATL", City: "Atlanta")
Airport.create(Code: "DFW", City: "Dallas & Fort Worth")
Airport.create(Code: "DEN", City: "Denver")
Airport.create(Code: "ORD", City: "Chicago")
      
a1 = Airport.find_or_create_by(Code: "ATL")
a2 = Airport.find_or_create_by(Code: "DFW")
a3 = Airport.find_or_create_by(Code: "DEN")
a4 = Airport.find_or_create_by(Code: "ORD")
Flight.create!( Date: Time.new(2023, 7, 9, 20,0,0).strftime("%d/%m/%Y"), Duration: 2, DepartureAirport: a1, DestinationAirport: a2 )
Flight.create!(Date: Time.new(2023, 7, 10, 10,0,0).strftime("%d/%m/%Y"), Duration: 2, DepartureAirport: a3, DestinationAirport: a4 )
