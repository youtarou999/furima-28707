class OrderDestination

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :authenticity_token, :order_destination, :token

  POSTAL_REGEX = /\A\d{3}[-]\d{4}\z/
  PHONE_REGEX  = /\A\d{10,11}\z/

  with_options presence: true do
    validates :postal_code,    format: {with: POSTAL_REGEX, message: 'ハイフンありで7桁の数字を入力してください'}                                             
    validates :city   
    validates :house_number
    validates :phone_number,   format: {with: PHONE_REGEX, message: 'ハイフンなしで10~11桁の数字を入力してください'}                  
  end

    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Destination.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, 
                                                     building_name: building_name, phone_number: phone_number,order_destination: order_destination, order_id: order.id)  
  end
end

