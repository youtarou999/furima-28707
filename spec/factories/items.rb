FactoryBot.define do
  factory :item do

    name                  {"商品名"}
    introduction          {"商品説明"}
    category_id           {1}
    price                 {300}
    product_condition_id  {1}
    postage_payer_id      {1}
    preparation_days_id   {1}
    prefecture_id         {1}  
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  
  end
end

