class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def account
    @trips = current_user.trips.reject { |trip| trip.transport.nil? }
    @compensations = Compensation.all

  end
end
