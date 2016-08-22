class CreateCarLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :car_locations do |t|
      t.string :description, null: false
      t.st_point :lonlat, srid: 4326, null: false

      t.timestamps

      t.index :lonlat, using: :gist
    end
  end


end
