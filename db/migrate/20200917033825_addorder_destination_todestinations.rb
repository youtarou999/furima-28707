class AddorderDestinationTodestinations < ActiveRecord::Migration[6.0]
  def change
    add_column :destinations, :order_destination, :string
  end
end
