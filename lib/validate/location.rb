module Validate
  class Location
    include ActiveModel::Validations

    attr_accessor :lat, :lon

    validates :lat, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
    validates :lon, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

    def initialize(lat, lon)
      lat = lat.to_f if lat.present? && !lat.is_a?(Numeric)
      lon = lon.to_f if lon.present? && !lon.is_a?(Numeric)
      @lat = lat
      @lon = lon
    end

    def self.from_string(latlon)
      if match = latlon.match(/(\-?\d+\.?\d*)[, ] ?(\-?\d+\.?\d*)$/)
        self.new(match[1], match[2])
      else
        raise ApiError::BadRequestError.new("Invalid format for latitude, longitude")
      end
    end

  end
end

