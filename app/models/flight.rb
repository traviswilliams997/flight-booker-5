class Flight < ApplicationRecord
    belongs_to :DepartureAirport, class_name: "Airport"
    belongs_to :DestinationAirport, class_name: "Airport"

end
