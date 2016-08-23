require 'rails_helper'

describe Validate::Location do

  describe ".from_string" do

    context "with valid location string" do
      let(:latlon) {"51.514251, -0.297732"}

      it "returns valid location object" do
        expect(Validate::Location.from_string(latlon).valid?).to be_truthy
      end

      it "not throw any errors" do
        expect {Validate::Location.from_string(latlon)}.not_to raise_error
      end
    end

    context "with invalid location string" do

      context "missing number before point" do
        let(:latlon) {"51.514251, -.297732"}

        it "throws bad request error" do
          expect {Validate::Location.from_string(latlon)}.to raise_error(ApiError::BadRequestError)
        end
      end

      context "non numeric as lat and lon" do
        let(:latlon) {"xyz, yxx"}

        it "throws bad request error" do
          expect {Validate::Location.from_string(latlon)}.to raise_error(ApiError::BadRequestError)
        end
      end
    end
  end

  describe "#initialize" do
    context "with valid lat and lon" do
      let(:lon){ "-0.297732" }
      let(:lat){ "51.514251" }

      it "should be valid" do
        expect(Validate::Location.new(lat, lon).valid?).to be_truthy
      end
    end

    context "with invalid lat and lon" do
      let(:lon){ "-217.297732" }
      let(:lat){ "515.514251" }

      before do
        @loc = Validate::Location.new(lat, lon)
        @valid = @loc.valid?
      end

      it "should be invalid" do
        expect(@valid).to be_falsey
      end

      it "errors hash should be populated" do
        expect(@loc.errors.messages[:lat]).to include('must be less than or equal to 90')
        expect(@loc.errors.messages[:lon]).to include('must be greater than or equal to -180')
      end
    end

    context "with missing lat and lon" do
      let(:lon){ "" }
      let(:lat){ "" }

      before do
        @loc = Validate::Location.new(lat, lon)
        @valid = @loc.valid?
      end

      it "should be invalid" do
        expect(@valid).to be_falsey
      end

      it "errors hash should be populated" do
        expect(@loc.errors.messages[:lat]).to include("can't be blank")
        expect(@loc.errors.messages[:lon]).to include("can't be blank")
      end
    end
  end
end