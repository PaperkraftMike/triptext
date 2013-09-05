class CreateNumbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
      t.integer :user_id
      t.string :phone_number
      t.integer :message_id

      t.timestamps
    end
  end
end
