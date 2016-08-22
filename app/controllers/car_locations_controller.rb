class CarLocationsController < ApplicationController

  def closest_cars
    closest_cars = CarSharing::ClosestCars.new(params)
    cars_locations = closest_cars.find_closest

    render json: cars_locations, each_serializer: CarLocationSerializer, root: :cars
  end

end