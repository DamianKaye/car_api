class Location
  include ActiveModel::Validations

  attr_accessor :lat, :lon

  validates :lat, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :lon, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  def initialize(lon,lat)
    @lon = lon
    @lat = lat
  end

end