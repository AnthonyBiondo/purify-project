class CompensationTripsController < ApplicationController
  def index
    @compensations = Compensation.all
  end

  def show
    @compensation = Compensation.find(params[:id])
  end
end
