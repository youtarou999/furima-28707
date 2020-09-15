class OrderDestination

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  POSTAL_REGEX = /\A\d{7}\z/
  PHONE_REGEX  = /\A\d{10,11}\z/

  with_options presence: true do
    validates :postal_code,    format: {with: POSTAL_REGEX, message: 'ハイフンなしで11桁の数字を入力してください'}                                             
    validates :city   
    validates :house_number
    validates :phone_number,   format: {with: PHONE_REGEX, message: 'ハイフンなしで10~11桁の数字を入力してください'}                  
  end

    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
end

