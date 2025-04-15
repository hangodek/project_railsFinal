class AddConfirmEmailAddressToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :confirm_email_address, :string, null: false
  end
end
