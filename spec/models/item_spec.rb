require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    context '商品の出品が正しく行われる場合' do
      it '全ての情報が正しく打ち込まれていると登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品が正しく行われない場合' do
      it '商品画像が添付されていなければ登録されない' do
      end

      it '商品名が空の場合登録されない' do
      end

      it '商品説明が空の場合登録されない' do
      end

      it 'カテゴリーが空の場合登録されない' do
      end

      it '商品の状態が空の場合登録されない' do
      end

      it '配送料の負担が空の場合登録されない' do
      end

      it '発送元が空の場合登録されない' do
      end

      it '発送までの日数が空の場合登録されない' do
      end

      it '価格が空の場合登録されない' do
      end

      it '商品の状態が空の場合登録されない' do
      end
 
end
