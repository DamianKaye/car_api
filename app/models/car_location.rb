class CarLocation < ApplicationRecord

  scope :closest, ->(lon, lat, num_cars) { 
    order(sanitize_sql(["lonlat::geometry <-> 'SRID=4326;POINT(? ?)'::geometry", lon, lat])).limit(num_cars) 
  }

  def latitude
    lonlat.y
  end

  def longitude
    lonlat.x
  end

end
