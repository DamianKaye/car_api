module CarSharing
  class ClosestCars

    extend ActiveModel::Naming

    DEFAULT_NUM_CARS = 10

    attr_reader :num_cars, :location

    def initialize(params)
      params = filter_params(params)
      create_location(params)

    end

    def find_closest
      CarLocation.closest(location.lon, location.lat, DEFAULT_NUM_CARS)
    end

    private

    def create_location(params)
      lon, lat = params["location"].split(',').map(&:to_d)

      @location = Location.new(lon, lat)

      raise ApiError::BadRequestError  unless location.valid?
    end

    def filter_params(params)
      raise ApiError::BadRequestError if params["location"].blank?

      params.slice(:location)
    end

  end
end