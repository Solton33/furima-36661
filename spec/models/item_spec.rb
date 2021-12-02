require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品が正しく行われる場合' do
      it '全ての情報が正しく打ち込まれていると登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品が正しく行われない場合' do
      it '商品画像が添付されていなければ登録されない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空の場合登録されない' do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品説明が空の場合登録されない' do
        @item.item_text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item text can't be blank")
      end

      it 'カテゴリーが空の場合登録されない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be balnk")
      end

      it '商品の状態が空の場合登録されない' do
        @item.status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be balnk")
      end

      it '配送料の負担が空の場合登録されない' do
        @item.delivery_fee = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be balnk")
      end

      it '発送元が空の場合登録されない' do
        @item.prefectures = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures can't be balnk")
      end

      it '発送までの日数が空の場合登録されない' do
        @item.shipping_date = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be balnk")
      end

      it '価格が空の場合登録されない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not a number")
      end

      it '価格は半角数値で入力されていない場合登録できない' do
        @item.price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '価格が300円以下の場合登録されない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が9999999円以上の場合登録されない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
