class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/ }
    validates :token
  end
    
    validates :prefectures_id, numericality: {other_than: 0, message: "can't be blank"}

    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      Address.create(postal_code: postal_code, prefectures_id: prefectures_id,municipality: municipality, address: address, building: building, phone_number: phone_number, order_id: order.id) 
    end
end