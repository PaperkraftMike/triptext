class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :zip_code
      t.string :state
      t.string :lat_long
      t.string :city
      t.string :street

      t.timestamps
    end
  end
end
