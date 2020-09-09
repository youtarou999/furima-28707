class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name,                 length: { maximum: 40 }                
    validates :introduction,         length: { maximum: 1000 }                
    validates :price               
    validates :category_id
    validates :product_condition_id
    validates :postage_payer_id
    validates :preparation_days_id
    validates :user_id
    validates :prefecture_id
  end
  
    validates_inclusion_of :price, in:300..9999999

end