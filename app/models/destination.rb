class Destination < ApplicationRecord
  belongs_to :transaction

  with_options presence: true do
    validates :postal_code                 
    validates :prefecture_id                
    validates :city             
    validates :house_number
    validates :phone_number           
    validates :preparation_days_id           
    validates :transaction_id      
  end

end


