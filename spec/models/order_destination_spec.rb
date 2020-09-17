require 'rails_helper'

RSpec.describe OrderDestination, type: :model do

  before do
    @order_destination = FactoryBot.build(:order_destination)
  end

  describe '購入機能' do
    context '購入がうまくいくとき' do
      it "全ての値が存在すれば購入できる" do
        expect(@order_destination).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it "tokenが入っていないと購入できない" do
        @order_destination.token = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号にハイフンが入っていないと購入できない" do
        @order_destination.postal_code = 1234567
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postal code ハイフンありで7桁の数字を入力してください")
      end
      it "電話番号にハイフンが入っていると購入できない" do
        @order_destination.phone_number = 111-1111-1111
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number ハイフンなしで10~11桁の数字を入力してください")
      end
      it "都道府県が空だと購入できない" do
        @order_destination.prefecture_id = 0
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "市町村が空だと購入できない" do
        @order_destination.city = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空だと購入できない" do
        @order_destination.house_number = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("House number can't be blank")
      end
      it "電話番号が空だと購入できない" do
        @order_destination.phone_number = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      
    end
  end








  
end
