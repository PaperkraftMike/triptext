class CreateNumbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
      t.integer :user_id
      t.string :phone_number
      t.integer :message_id

      t.timestamps
    end

    add_index :numbers, :message_id
    add_index :numbers, :user_id
  end
end
