require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品機能' do
    context '出品できる' do
      it '全ての記述がが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'productが空では出品できない' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it 'product_descriptionが空では出品できない' do
        @item.product_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end
      it 'categoryが空では出品できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以上でないと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが9999999以下でないと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが半角数字でないと出品できない' do
        @item.price = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'stateが空では出品できない' do
        @item.state = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it 'freightが空では出品できない' do
        @item.freight = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Freight can't be blank")
      end
      it 'due_dateが空では出品できない' do
        @item.due_date = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Due date can't be blank")
      end
    end
  end
end