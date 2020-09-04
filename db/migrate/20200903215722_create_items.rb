class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,                  null: false
      t.text    :introduction,          null: false
      t.integer :price,                 null: false                                
      t.integer :category_id,           null: false, foreign_key: true
      t.integer :product_condition_id,  null: false, foreign_key: true
      t.integer :postage_payer_id,      null: false, foreign_key: true
      t.integer :preparation_days_id,   null: false, foreign_key: true
      t.integer :user_id,               null: false, foreign_key: true 
      t.string  :email,                 null: false, default: ""
      t.string  :encrypted_password,    null: false, default: ""
      t.timestamps
    end
  end
end


