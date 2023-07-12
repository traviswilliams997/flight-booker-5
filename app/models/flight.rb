class Flight < ApplicationRecord
    has_many :bookings
    has_many :passengers, through: :bookings
    belongs_to :DepartureAirport, class_name: "Airport"
    belongs_to :DestinationAirport, class_name: "Airport"


    def self.user_search(query_params)
        where(DepartureAirport_id: query_params[:DepartureAirport_id],
              DestinationAirport_id: query_params[:DestinationAirport_id],
              Date: query_params[:Date])
      end
    
end
