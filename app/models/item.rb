class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :prefectures
  belongs_to :shipping_date
  belongs_to :status
  has_one_attached :image

  validates :item_name, :item_text, :price, :user, presence: true
  validates :category_id, :status_id, :delivery_fee_id, :prefectures_id, :shipping_date_id, numericality: { other_than: 1, message: "can't be balnk"}

end
