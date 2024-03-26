class MapsController < ApplicationController
  require 'net/http'

  def directions
    origin = params[:departure]
    destination = params[:destination]

    travel_mode = ['walking', 'driving', 'bicycling']
    distance_response_object = {}

    api_key = ENV.fetch("GOOGLE_MAPS_API_KEY")

    travel_mode.each do |transport_mode|
      url = "https://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{destination}&mode=#{transport_mode}&key=#{api_key}"
      response = Net::HTTP.get_response(URI(url))
      json_response = JSON.parse(response.body)
      distance_value = json_response["routes"][0]["legs"][0]["distance"]["text"]
      distance_response_object[transport_mode] = distance_value
    end

    render json: distance_response_object

  end
end
