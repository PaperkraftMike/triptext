class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.datetime :dispatch_on
      t.string :phone_number
      t.string :ip_address
      t.integer :number_id
      t.boolean :sent
    end
  end
end
