FactoryBot.define do
  factory :order_destination do
    
    token                 {1}
    postal_code           {"123-4567"}
    prefecture_id         {1}
    city                  {"市町村"}
    house_number          {"番地"}
    building_name         {"建物名"}
    phone_number          {12312345678}
    
  end
end
