require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, product_id: product.id)
  end
  describe '商品購入' do
    context '購入できるとき' do
      it '正常に購入できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存可能' do
        @order_address.building_name =""
        expect(@order_address).to be_valid
      end
    end
    context '購入出来ない時' do
      it 'postcodeが空では登録できない' do
        @order_address.postcode = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeは半角でなければ登録できない' do
        @order_address.postcode = '１２３ー４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'postcodeはハイフンなしでは登録できない' do
        @order_address.postcode = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '発送元地域の情報が空だと登録できない' do
        @order_address.area = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'house_numberが空では登録できない' do
        @order_address.house_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephone_numberが空では登録できない' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが9文字以下では登録できない' do
        @order_address.telephone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is too short")
      end
      it 'telephone_numberが12文字以上では登録できない' do
        @order_address.telephone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid. Input only number")
      end
     
      it 'telephone_numberにハイフンを含むと登録できない' do
        @order_address.telephone_number = '123-4567890'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid. Input only number")
      end
      it 'userが紐づいていないと登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'productが紐づいていないと登録できない' do
        @order_address.product_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
