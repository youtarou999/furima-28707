class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image

  PRICE_REGEX = /\A[0-9]+\z/

  with_options presence: true do
    validates :name,                 length: { maximum: 40 }                
    validates :introduction,         length: { maximum: 1000 }                
    validates :price,                format: { with: PRICE_REGEX, message: '半角数字を入力してください' }
    validates :category_id
    validates :product_condition_id
    validates :postage_payer_id
    validates :preparation_days_id
    validates :user_id
    validates :prefecture_id
  end
  
    validates_inclusion_of :price, in:300..9999999

end