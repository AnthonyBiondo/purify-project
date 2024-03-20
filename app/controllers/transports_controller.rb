class TransportsController < ApplicationController
  before_action :set_trip, only: %i[index]

  def index
    @transports = Transport.where(id: params[:transports])
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

#   def transport_params
#     params.require(:transport).permit(:transport_type, :duration, :distance, :co2_capacity)
#   end
end
