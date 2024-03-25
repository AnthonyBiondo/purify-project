class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update]

  def index
    @trips = Trip.all
  end

  def show
    @transport = @trip&.transport_id
    @transport = Transport.find(@transport)
    @trips = Trip.all

    # Geocode Markers
    @markers = @trip.geocode
    destination_marker = Geocoder.search(@trip.destination)
    departure_marker = Geocoder.search(@trip.departure)
    destination_lat_long = [destination_marker[0].latitude, destination_marker[0].longitude]
    departure_lat_long = [departure_marker[0].latitude, departure_marker[0].longitude]
    @markers = [destination_lat_long, departure_lat_long]

    # Calculate Distance
    @trip_distance = Geocoder::Calculations.distance_between(departure_lat_long, destination_lat_long)

    # Calculate Center
    @trip_center = Geocoder::Calculations.geographic_center([departure_lat_long, destination_lat_long])

    # Define Bounding Box
    @bounding_params = Geocoder::Calculations.bounding_box(@trip_center, (@trip_distance / 1.8))
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.create(trip_params)
    @trip.user = current_user
    @trip.save
    calculate_transport_attributes

    redirect_to trip_transports_path(@trip, { transports: @transports })
  end

  def edit
  end

  def update
    @trip.update(trip_params)
    redirect_to trips_path(@trip)
  end

  def add_transport
    transport = Transport.find(params[:transport_id])
    trip = Trip.find(params[:trip_id])
    trip.transport_id = transport.id
    trip.save

    redirect_to trip_path(trip)
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:departure, :destination)
  end

  def calculate_transport_attributes
    @transports = []
    ["Plane", "Car", "Bike", "Train", "Boat", "Carpool", "Bus"].map do |type|
      transport = Transport.create(transport_type: type, duration: 6, distance: 300, co2_capacity: 10000)
      transport.save
      @transports << transport
    end
    #  Implémente le calcul du Co2 + de la distance + duration
    return @transports
  end
end
