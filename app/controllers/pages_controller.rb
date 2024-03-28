class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def account
    @trips = current_user.trips.reject { |trip| trip.transport.nil? }
    @compensations = Compensation.all

    @carbon_sum = 0
    @compensation_sum = 0

    @trips.each do |trip|
      @carbon_sum += trip.transport.co2_capacity
      trip.compensation_trips.each do |compensation_trip|
        @compensation_sum += compensation_trip.compensation.co2_absorption
      end
    end
  end
end
