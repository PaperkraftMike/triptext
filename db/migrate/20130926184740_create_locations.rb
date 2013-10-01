class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :zip_code
      t.string :lat_long
      t.string :street
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps
    end
  end
end
