class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :zip_code
      t.string :state
      t.string :city
      t.string :street
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
