require "application_system_test_case"

class FlightsTest < ApplicationSystemTestCase
  setup do
    @flight = flights(:one)
  end

  test "visiting the index" do
    visit flights_url
    assert_selector "h1", text: "Flights"
  end

  test "should create flight" do
    visit flights_url
    click_on "New flight"

    fill_in "Date", with: @flight.Date
    fill_in "Departureairport", with: @flight.DepartureAirport
    fill_in "Destinationairport", with: @flight.DestinationAirport
    fill_in "Duration", with: @flight.Duration
    fill_in "Time", with: @flight.Time
    click_on "Create Flight"

    assert_text "Flight was successfully created"
    click_on "Back"
  end

  test "should update Flight" do
    visit flight_url(@flight)
    click_on "Edit this flight", match: :first

    fill_in "Date", with: @flight.Date
    fill_in "Departureairport", with: @flight.DepartureAirport
    fill_in "Destinationairport", with: @flight.DestinationAirport
    fill_in "Duration", with: @flight.Duration
    fill_in "Time", with: @flight.Time
    click_on "Update Flight"

    assert_text "Flight was successfully updated"
    click_on "Back"
  end

  test "should destroy Flight" do
    visit flight_url(@flight)
    click_on "Destroy this flight", match: :first

    assert_text "Flight was successfully destroyed"
  end
end
