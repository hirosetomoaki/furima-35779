require 'rails_helper'

RSpec.describe Buy, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buyaddress = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
    sleep (0.1)
  end

  describe '購入機能' do
    context '購入できる' do
      it '全ての記述が存在すれば購入できる' do
        expect(@buyaddress).to be_valid
      end
      it '建物名が空でも購入できる' do
        @buyaddress.building_name = ''
        expect(@buyaddress).to be_valid
      end
    end

    context '購入できない' do
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
      it '郵便番号にハイフンがなかれば購入できない' do
        @buyaddress.postal_code = '1231111'
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県が存在しないと購入できない' do
        @buyaddress.state_id = ''
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("State can't be blank")
      end
      it '都道府県に未選択の場合だと購入できない' do
        @buyaddress.state_id = 1
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
      it '電話番号が半角英数混合だと登録できない' do
        @buyaddress.phone = '111aaaa'
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
