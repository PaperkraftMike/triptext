class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_number_id
      t.integer :contact_id
      t.boolean :banned
      t.string :address
      t.string :zip_code

      t.timestamps
    end
  end
end
