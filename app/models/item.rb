class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

 
  belongs_to :category
  belongs_to :sales_status
  belongs_to :prefecture
  belongs_to :shipping_fee_status
  belongs_to :scheduled_delivery

  has_one_attached :image
  belongs_to :user


  validates :image, presence: { message: "を選択してください" }
  validates :name, presence: true
  validates :info, presence: true
  validates :user, presence: true
  validates :price, presence: true

  with_options numericality: { other_than: 1, message: "を選択してください" } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end


end
