class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :name                  
    validates :introduction                
    validates :price               
    validates :category_id
    validates :product_condition_id
    validates :postage_payer_id
    validates :preparation_days_id
    validates :user_id
  end
end

