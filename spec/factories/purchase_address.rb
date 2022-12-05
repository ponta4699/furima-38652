FactoryBot.define do
  factory :purchase_address do
    post_code { '123-1234' }
    prefecture_id { 3 }
    city { '横浜市緑区' }
    house_number { '3-4' }
    building_name { '青山ビル' }
    phone_number { '09012341234' }
    

    association :user_id
    association :item_id
  end
end