require 'rails_helper'
RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品機能' do
    context '出品がうまくいくとき' do
      it "image、name、category_id、price、product_condition_id、postage_payer_id、preparation_days_id、prefecture_id、user_idが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "カテゴリーが空だと登録できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it "商品の状態が空だと登録できない" do
        @item.product_condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition must be other than 0")
      end
      it "配送料の負担が空だと登録できない" do
        @item.postage_payer_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer must be other than 0")
      end
      it "発送元の地域が空だと登録できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it "発送までの日数が空だと登録できない" do
        @item.preparation_days_id  = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation days must be other than 0")
      end
      it "価格が￥300以下だと登録できない" do
        @item.price  = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "価格が￥9,999,999以上だと登録できない" do 
        @item.price  = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end