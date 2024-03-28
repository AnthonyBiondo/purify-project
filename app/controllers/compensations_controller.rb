class CompensationsController < ApplicationController
  def show
    @compensation = Compensation.find(params[:id])
    @compensation_trip = CompensationTrip.new
    @my_trips = current_user.trips
  end
end
