class Airport < ApplicationRecord
    has_many :departing_flights, 
    class_name: "Flight",
    foreign_key: :DepartureAirport,
    dependent: :destroy
    
    has_many :arriving_flights,
    class_name: "Flight", 
    foreign_key: :DestinationAirport, 
    dependent: :destroy
end
