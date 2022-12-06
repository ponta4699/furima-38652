FactoryBot.define do
  factory :item do
    name                    { 'item' }
    info                    { Faker::Lorem.sentence }
    price                   { '10000' }
    category_id             { 2 }
    sales_status_id         { 2 }
    shipping_fee_status_id  { 2 }
    prefecture_id           { 2 }
    scheduled_delivery_id   { 2 }

    association :user

 

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/comment.png'), filename: 'comment.png')
    end
  end
end