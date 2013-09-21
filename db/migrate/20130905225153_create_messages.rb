class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :category
      t.datetime :dispatch_on
      t.string :ip_address
      t.string :text
      t.integer :user_id
      t.integer :number_id
      t.integer :address_id

      t.timestamps
    end

    add_index :messages, :user_id
    add_index :messages, :number_id
    add_index :messages, :address_id
  end
end
