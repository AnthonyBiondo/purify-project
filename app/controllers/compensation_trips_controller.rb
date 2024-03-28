class CompensationTripsController < ApplicationController
  def create
    trip = Trip.find(params[:compensation_trip][:trip])
    compensation = Compensation.find(params[:compensation_id])
    compensation_trip = CompensationTrip.create(trip: trip, compensation: compensation)
    number_of_trees = params[:other][:number_of_trees].to_i
    total_co2 = (number_of_trees * compensation.co2_absorption.to_i)
    if compensation_trip.update(status: total_co2)
      flash[:notice] = "Thanks for your compensation."
    else
      flash[:alert] = "Hmmm somthing went wrong..."
    end
    redirect_to users_account_path
  end

  def edit
    @compensation_trip = CompensationTrip.find(params[:id])
  end

  def update
    # @compensation_trip.update()
  end

  private

  def compensation_params
    # params.require(:compensation_trip).permit(:name)
  end
end
