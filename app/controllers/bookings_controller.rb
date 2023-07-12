class BookingsController < ApplicationController
    def show 
    
    end 
    
    def new 
        @booking = Booking.new
        @flight = Flight.find(params[:flight_id])
        @num_of_passengers = params[:num_of_passengers]
        @booking.passengers.build

    end
    
    def create 
    end 

    private
    
    def booking_params
      params.require(:booking).permit(:flight_id,
                                      passengers_attributes: [:name, :email])
      end

end
