json.extract! flight, :id, :DepartureAirport, :DestinationAirport, :Date, :Time, :Duration, :created_at, :updated_at
json.url flight_url(flight, format: :json)
