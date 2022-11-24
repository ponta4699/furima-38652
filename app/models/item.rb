class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

 
  belongs_to :category
  belongs_to :sales_status
  belongs_to :prefecture
  belongs_to :shipping_fee_status
  belongs_to :scheduled_delivery

  has_one_attached :image
  belongs_to :user


end
