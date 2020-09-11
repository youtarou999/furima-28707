class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image

  PRICE_REGEX = /\A[0-9]+\z/

    validates :image,                presence: true
    validates :name,                 presence: true,  length: { maximum: 40 }                
    validates :introduction,         presence: true,  length: { maximum: 1000 }                
    validates :price,                presence: true,  format: { with: PRICE_REGEX, message: '半角数字を入力してください'} 
    validates :category_id,          numericality: { other_than: 0 } 
    validates :product_condition_id, numericality: { other_than: 0 }
    validates :postage_payer_id,     numericality: { other_than: 0 }
    validates :preparation_days_id,  numericality: { other_than: 0 }
    validates :prefecture_id,        numericality: { other_than: 0 }
  
  
    validates_inclusion_of :price, in:300..9999999

end
