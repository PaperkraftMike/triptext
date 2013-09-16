class AddGmapstoAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :latitude,  :float #you can change the name, see wiki
    add_column :addresses, :longitude, :float #you can change the name, see wiki
    add_column :addresses, :gmaps, :boolean #not mandatory, see wiki
  end
end
