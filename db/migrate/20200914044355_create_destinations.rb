class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string  :postal_code,         null: false
      t.integer :prefecture_id,       null: false
      t.string  :city,                null: false                                
      t.string  :house_number,        null: false
      t.integer :building_name,       null: false
      t.integer :phone_number,        null: false
      t.integer :preparation_days_id, null: false
      t.integer :transaction_id,      null: false, foreign_key: true
      t.timestamps
    end
  end
end

