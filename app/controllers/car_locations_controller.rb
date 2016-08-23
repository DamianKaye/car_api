class CarLocationsController < ApplicationController
  DEFAULT_CLOSEST_CARS = 10

  def closest_cars
    filter_params
    loc = Validate::Location.from_string(params["location"])

    if loc.valid?
      cars_locations = CarLocation.closest(loc.lon, loc.lat, DEFAULT_CLOSEST_CARS)
      render json: cars_locations, each_serializer: CarLocationSerializer, root: :cars
    else
      api_error status: 400, errors: loc.errors
    end
  end

  private

  def filter_params
    raise ApiError::BadRequestError if params["location"].blank?

    params.slice("location")
  end
end