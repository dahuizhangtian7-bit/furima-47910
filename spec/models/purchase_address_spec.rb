require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
  end

  describe '購入情報の保存' do
    context '商品が購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingは空でも購入できること' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end
    context '商品が購入できない場合' do
      it 'postalが空の場合は購入できない' do
        @purchase_address.postal = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal can't be blank")
      end
      it 'postalに全角文字列が入っている場合は購入できない' do
        @purchase_address.postal = '１２３－４５６７'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal is invalid. Include hyphen(-)')
      end
      it 'postalのハイフンが抜けている場合は購入できない' do
        @purchase_address.postal = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal is invalid. Include hyphen(-)')
      end
      it 'area_idが1では購入できない' do
        @purchase_address.area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityが空の場合は購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空の場合は購入できない' do
        @purchase_address.street = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street can't be blank")
      end
      it 'phone_numberが空の場合は購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが数字以外では購入できない' do
        @purchase_address.phone_number = 'あいうえお'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが全角数字では購入できない' do
        @purchase_address.phone_number = '１２３４５６７８９０'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが10桁未満では購入できない' do
        @purchase_address.phone_number = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが11桁より多い場合は購入できない' do
        @purchase_address.phone_number = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では購入できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていないと購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
