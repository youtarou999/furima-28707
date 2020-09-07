class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name,                 length: { maximum: 40 }                
    validates :introduction,         length: { maximum: 1000 }                
    validates :price               
    validates :category_id,          foreign_key: true
    validates :product_condition_id, foreign_key: true
    validates :postage_payer_id,     foreign_key: true
    validates :preparation_days_id,  foreign_key: true
    validates :user_id,              foreign_key: true
  end
end

