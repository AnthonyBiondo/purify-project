class TripsController < ApplicationController
  before_action :set_trip, only: %i[show edit update]

  def index
    @trips = Trip.all
  end

  def show
    @transport = @trip.transport


    geocoder_transport
  end

  def new
    @trip = Trip.new
  end

  def create

    @trip = Trip.new(trip_params)
    @trip.user = current_user
    @trip.save

    redirect_to trip_transports_path(@trip)
  end

  def edit
  end

  def update
    @trip.update(trip_params)
    redirect_to trips_path(@trip)
  end

  def add_transport
    trip = Trip.find(params[:trip_id])
    transport_type = TransportType.find(params[:transport_type])
    transport = Transport.new(
      distance: params[:trip_distance],
      transport_type_id: transport_type.id,
      duration: "pas encore codé",
      co2_capacity: "pas codé"
    )
    transport.trip = trip
    trip.transport = transport
    transport.save
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

  # def calculate_transport_attributes
  #   @transports = TransportType.all
  #   geocoder_transport
  #   #  Implémente le calcul du Co2 + de la distance + duration
  #   return @transports
  # end

  def geocoder_transport
    # Geocode Markers
    # @markers = @trip.geocode
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
end
