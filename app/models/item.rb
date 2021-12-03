class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :prefectures
  belongs_to :shipping_date
  belongs_to :status
  belongs_to :user
  has_one_attached :image

  validates :item_name, :item_text, :price, :image, presence: true
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality:{only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :category_id, :status_id, :delivery_fee_id, :prefectures_id, :shipping_date_id, numericality: { other_than: 1, message: "can't be balnk"}

end
