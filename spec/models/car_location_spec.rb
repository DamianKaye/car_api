require 'rails_helper'

RSpec.describe CarLocation, :type => :model do

  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:lonlat) }

  describe ".closest" do
    
    let!(:closest_loc) {FactoryGirl.create(:hamilton_location)}
    let!(:furtherest_loc) {FactoryGirl.create(:angel_location)}
    let(:num_cars) { 10 }

    before do
      create_all_locations
      @car_locs = CarLocation.closest(closest_loc.longitude, closest_loc.latitude, num_cars)
    end
    
    it "returns correct locations" do
      expect(@car_locs.first).to eq(closest_loc)
      expect(@car_locs.last).to eq(furtherest_loc)
      expect(@car_locs.count).to eq(num_cars)
    end 
  end
end