class Destination < ApplicationRecord
  belongs_to :orders

  POSTAL_REGEX = /\A\d{7}\z/
  PHONE_REGEX  = /\A\d{10,11}\z/

  with_options presence: true do
    validates :postal_code,    format: {with: POSTAL_REGEX, message: 'ハイフンなしで11桁の数字を入力してください'}                 
    validates :prefecture_id                             
    validates :city   
    validates :house_number
    validates :phone_number,   format: {with: PHONE_REGEX, message: 'ハイフンなしで10~11桁の数字を入力してください'}                  
  end
end

