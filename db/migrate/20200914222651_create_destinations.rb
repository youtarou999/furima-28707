class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string  :postal_code,        default: "",   null: false
      t.integer :prefecture_id,                     null: false
      t.string  :city,               default: "",   null: false                                
      t.string  :house_number,       default: "",   null: false
      t.integer :building_name
      t.integer :phone_number,                      null: false
      t.integer :order_id,                          null: false, foreign_key: true
      t.timestamps
    end
  end
end
