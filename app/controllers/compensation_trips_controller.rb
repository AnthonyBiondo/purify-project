class CompensationTripsController < ApplicationController
  def create
    @trip = Trip.find(params[:compensation_trip][:trip])
    @compensation = Compensation.find(params[:compensation_id])
    CompensationTrip.create(trip: @trip, compensation: @compensation)
    redirect_to users_account_path
  end
end
