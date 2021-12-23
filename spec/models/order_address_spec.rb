require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, user_id: user.id)
  end

  context '購入ができる場合' do
    it '全ての値が正しく入力されていれば購入できる' do
    end

    it 'buildingは空でも購入できる' do
    end
  end

  context '購入ができない場合' do
    it '郵便番号が空では登録できない' do
    end

    it '郵便番号に『-』が無いと登録できない' do
    end

    it '郵便番号の前半が３桁で無いと登録できない' do
    end

    it '郵便番号の後半が４桁で無いと登録できない' do
    end

    it '都道府県が空では登録できない' do
    end

    it '都道府県が『--』では登録できない' do
    end

    it '市区町村が空では登録できない' do
    end

    it '番地が空では登録できない' do
    end

    it '電話番号が空では登録できない' do
    end

    it '電話番号に『-』がある場合登録できない' do
    end

    it '電話番号が9桁以下では登録できない' do
    end

    it '電話番号が12桁以上では登録できない' do
    end

    it 'tokenが空では登録できない' do
    end

  end

end
