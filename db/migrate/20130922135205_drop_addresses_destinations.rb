class DropAddressesDestinations < ActiveRecord::Migration
  def change
    drop_table :addresses
    drop_table :destinations
  end
end
