require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  describe '商品出品' do
    context '出品できるとき' do
      it '正常に出品できる' do
        expect(@product).to be_valid
      end
      it '価格が半角・300円〜9,999,999円の間であれば出品可能' do
        @product.price = '10000'
        expect(@product).to be_valid
      end
    end
    context '出品出来ない時' do
      it '画像が空では登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では登録できない' do
        @product.introduction = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'カテゴリーが空では登録できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の情報が空では登録できない' do
        @product.condition_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担の情報が空では登録できない' do
        @product.shipping_cost_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it '発送元地域の情報が空だと登録できない' do
        @product.area_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Area can't be blank")
      end
      it '発送日数の情報が空だと登録できない' do
        @product.ship_date_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Ship date can't be blank")
      end
      it '価格が空では登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円未満だと登録できない' do
        @product.price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is out of setting range")
      end
      it '価格が1000万円以上だと登録できない' do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is out of setting range")
      end
      it '価格が全角だと登録できない' do
        @product.price = '１１１１'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price Half-width number')
      end
      it 'userが紐づいていないと登録できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end