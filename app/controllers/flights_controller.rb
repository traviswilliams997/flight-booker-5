class FlightsController < ApplicationController
  before_action :set_flight, only: %i[ show edit update destroy ]

  # GET /flights or /flights.json
  def index
    @flights = Flight.all
    @airports = Airport.all
    @departure_options =  Airport.all.map{ |a| [ a.Code ] } 
    @destination_options =  Airport.all.map{ |a| [ a.Code ] } 
    @days = Flight.all.pluck(:date).uniq 
    @searched_flights = Flight.user_search(query_params)
    @departure_airport = Airport.where(id: query_params[:DepartureAirport_id]).pluck(:Code).first
    @destination_airport = Airport.where(id: query_params[:DestinationAirport_id]).pluck(:Code).first
    @departure_date = query_params[:Date]

  end

  # GET /flights/1 or /flights/1.json
  def show
  end

  # GET /flights/new
  def new
    @flight = Flight.new
  end

  # GET /flights/1/edit
  def edit
  end

  # POST /flights or /flights.json
  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to flight_url(@flight), notice: "Flight was successfully created." }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1 or /flights/1.json
  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to flight_url(@flight), notice: "Flight was successfully updated." }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1 or /flights/1.json
  def destroy
    @flight.destroy

    respond_to do |format|
      format.html { redirect_to flights_url, notice: "Flight was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flight_params
      params.require(:flight).permit(:DepartureAirport, :DestinationAirport, :Date, :Time, :Duration)
    end

    def query_params
      params.permit(:DepartureAirport_id, :DestinationAirport_id, 
                    :Date, :commit, :authenticity_token)
    end
end
