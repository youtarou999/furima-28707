FactoryBot.define do
  factory :order_destination do
    
    number                {4242424242424242}
    exp_month             {3} 
    exp_year              {24}
    cvc                   {123}
    postal_code           {111-1111}
    prefecture_id         {1}
    city                  {"市町村"}
    house_number          {"番地"}
    building_name         {"建物名"}
    phone_number          {12312345678}
    
  end
end
