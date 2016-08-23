require 'rails_helper'

RSpec.describe "CarLocations", :type => :request do

  describe "GET /cars" do

    let!(:closest_loc) {FactoryGirl.create(:hamilton_location)}
    let!(:furtherest_loc) {FactoryGirl.create(:angel_location)}

    before do
      create_all_locations
      get cars_url(params)
    end

    context "with correct params" do
      let(:params) { { "location" => "#{closest_loc.latitude}, #{closest_loc.longitude}" } }

      it "responds with a 200" do
        expect(response).to have_http_status(200)     
      end

      it "to be a valid response body" do
        body = JSON.parse(response.body)

        first_location_description = body["cars"].first["description"]
        last_location_description = body["cars"].last["description"]

        expect(closest_loc.description).to eq(first_location_description)
        expect(furtherest_loc.description).to eq(last_location_description)
        expect(body["cars"].length).to eq(CarLocationsController::DEFAULT_CLOSEST_CARS)
      end
    end

    context "with incorrect params" do
      
      context "with invalid lon lat params" do
        let (:lat) {"555.33334"}
        let (:lon) {"-222.5554"}
        let(:params) { { "location" => "#{lat}, #{lon}" } }    

        it "responds with a 400" do
          expect(response).to have_http_status(400)     
        end

        it "sets error messages" do
          body = JSON.parse(response.body)

          expect(body["errors"]["lat"]).to eq(["must be less than or equal to 90"])
          expect(body["errors"]["lon"]).to eq(["must be greater than or equal to -180"])
        end
      end

      context "with missing location param" do
        let (:lat) {"51.514251"}
        let (:lon) {"-0.297732"}
        let(:params) { { "locationismissing" => "#{lat}, #{lon}" } }

        it "responds with a 400" do
          expect(response).to have_http_status(400) 
        end

        it "sets error message" do
          body = JSON.parse(response.body)

          expect(body["errors"]).to eq("Bad Request: Location param is missing")
        end
      end

      context "with bad lon lat params" do
        let (:lat) {"xyx"}
        let (:lon) {"yxy"}
        let(:params) { { "location" => "#{lat}, #{lon}" } }    

        it "responds with a 400" do
          expect(response).to have_http_status(400)     
        end

        it "sets error message" do
          body = JSON.parse(response.body)

          expect(body["errors"]).to eq("Bad Request: Invalid format for latitude, longitude")
        end
      end
    end
  end
end