class AddConfirmationToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :confirmation,  :boolean 
  end
end
 
