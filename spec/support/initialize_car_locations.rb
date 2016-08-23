module InitializeCarLocations
  LOCATION_FACTORIES = [:belsize_location, :subury_location, :queen_park_location, :christchurch_location, :nottinghill_location,
               :spencer_location, :baywater_location, :kensal_town_location]

  def create_all_locations
    LOCATION_FACTORIES.each do |loc|
      FactoryGirl.create(loc)
    end
  end

end