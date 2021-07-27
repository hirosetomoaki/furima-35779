require 'rails_helper'

RSpec.describe Buy, type: :model do
  before do
    @buyaddress = FactoryBot.build(:buy_address)
  end

  describe '購入機能' do
    context '購入できる' do
      it '全ての記述が存在すれば購入できる' do
        expect(@buyaddress).to be_valid
      end
    end

    context '購入できない' do
      #it 'クレジットカード情報が存在しないと購入できない' do
      #end
      #it 'クレジットカード有効期限が存在しないと購入できない' do
      #end
      #it 'クレジットカードセキュリティコードが存在しないと購入できない' do
      #end
      it '郵便番号が存在しないと購入できない' do
        @buyaddress.postal_code = ''
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が3桁ハイフン4桁の半角文字列のみ保存可能なこと' do
        @buyaddress.postal_code = '1231-1111'
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県が存在しないと購入できない' do
        @buyaddress.state_id = ''
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("State can't be blank")
      end
      it '市区町村が存在しないと購入できない' do
        @buyaddress.city = ''
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("City can't be blank")
      end
      it '番地が存在しないと購入できない' do
        @buyaddress.street = ''
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("Street can't be blank")
      end
      it '電話番号が存在しないと購入できない' do
        @buyaddress.phone = ''
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号は10桁以上11桁以内の半角数字のみ保存可能なこと' do
        @buyaddress.phone = '111111111'
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("Phone is invalid")
      end
      it 'tokenが存在しないと購入できない' do
        @buyaddress.token = nil
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("Token can't be blank")
      end
    end
  end


end
