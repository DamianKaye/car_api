class CreateCarLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :car_locations do |t|
      t.string :description
      t.st_point :lonlat, geographic: true

      t.timestamps

       t.index :lonlat, using: :gist
    end
  end
end
