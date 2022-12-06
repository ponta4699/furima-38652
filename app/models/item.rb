class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

 
  belongs_to :category
  belongs_to :sales_status
  belongs_to :prefecture
  belongs_to :shipping_fee_status
  belongs_to :scheduled_delivery

  has_one_attached :image
  belongs_to :user
  has_one :purchase


  validates :image, presence: { message: "Image can't be blank" }
  validates :name, presence: true
  validates :info, presence: true
  validates :price, presence: true
  
  

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  with_options presence: true do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end


end
