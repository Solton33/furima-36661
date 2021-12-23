require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id,item_id: item.id)
    sleep 0.1
  end

  context '購入ができる場合' do
    it '全ての値が正しく入力されていれば購入できる' do
      expect(@order_address).to be_valid
    end

    it 'buildingは空でも購入できる' do
      @order_address.building = ''
      expect(@order_address).to be_valid
    end
  end

  context '購入ができない場合' do
    it '郵便番号が空では購入できない' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
    end

    it '郵便番号に『-』が無いと購入できない' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end

    it '郵便番号の前半が３桁で無いと購入できない' do
      @order_address.postal_code = '12-3456'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end

    it '郵便番号の後半が４桁で無いと購入できない' do
      @order_address.postal_code = '123-567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end

    it '都道府県が空では購入できない' do
      @order_address.prefectures_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefectures can't be blank")
    end

    it '都道府県が『--』では購入できない' do
      @order_address.prefectures_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefectures can't be blank")
    end

    it '市区町村が空では購入できない' do
      @order_address.municipality = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
    end

    it '番地が空では購入できない' do
      @order_address.address = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が空では購入できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号に『-』がある場合購入できない' do
      @order_address.phone_number = 123-456-7
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")

    end

    it '電話番号が9桁以下では購入できない' do
      @order_address.phone_number = 123456789
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it '電話番号が12桁以上では購入できない' do
      @order_address.phone_number = 123456789012
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it 'tokenが空では購入できない' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'userが紐づいていないと購入できない' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが紐づいていないと購入できない' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")

    end

  end

end
