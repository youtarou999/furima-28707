require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it  "image、name、が存在すれば登録できる" do
          expect(@user).to be_valid
        end
        it  "passwordが6文字以上の半角英数字混合であれば登録できる" do
          @user.password = "Abc123"
          @user.password_confirmation = "Abc123"
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it "nameが空だと登録できない" do
          @user.name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Name can't be blank")
        end
        it "emailが空だと登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "重複したemailが存在する場合登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it "emailに@がない場合登録できない" do
          @user.email = "test.com"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it "passwordが5文字以下の場合登録できない" do
          @user.password = "12345"
          @user.password_confirmation = "12345"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it "passwordが半角英数字混合でない場合登録できない" do
          @user.password = "Abcdef"
          @user.password_confirmation = "Abcdef"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password 英字と数字の両方を含めて設定してください")
        end
        it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "ユーザー本名の名字が空の場合登録できない" do
          @user.family_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end
        it "ユーザー本名の名前が空の場合登録できない" do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it "ユーザー本名のフリガナが全角（カタカナ）でない場合登録できない" do
          @user.family_name_kana = "やまだ"
          @user.first_name_kana = "たろう"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana 全角カナを使用してください")
        end
        it "生年月日がないと登録できない" do
          @user.birthday = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
end

end
