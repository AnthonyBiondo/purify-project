class TransportsController < ApplicationController
  before_action :set_trip, only: %i[index]

  def index
    @transports = Transport.where(id: params[:transports])
    @transport_types = TransportType.all

    geocoder_transport
  end

#   def create
#     @transport = Transport.new(transport_params)
#     @trip.transport = @transport
#     @transport.save
#     redirect_to trips_path(@trip)
#   end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def geocoder_transport
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

#   def transport_params
#     params.require(:transport).permit(:transport_type, :duration, :distance, :co2_capacity)
#   end
end
