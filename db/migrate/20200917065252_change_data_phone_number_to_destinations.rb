class ChangeDataPhoneNumberToDestinations < ActiveRecord::Migration[6.0]
  def change
      change_column :destinations, :phone_number, :string
  end
end
