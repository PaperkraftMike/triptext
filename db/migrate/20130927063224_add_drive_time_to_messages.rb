class AddDriveTimeToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :drive_time, :integer
  end
end