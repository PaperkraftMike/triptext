class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :fname
      t.string :lname
      t.integer :address_id
      t.integer :number_id

      t.timestamps
    end

    add_index :contacts, :address_id
    add_index :contacts, :number_id
  end
end
