require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

    describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、本名が存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
       end

       it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
       end

       it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
       end

       it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
       end
      
       it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
       end
      
       it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
       end

      it "ニックネームが必須であること(nicknameが空だと登録できない)" do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "メールアドレスが必須であること(emailが空では登録できない)" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "メールアドレスが一意性であること(重複したemailが存在する場合登録できない)" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "メールアドレスは、@を含む必要があること" do
        @user.email = "a.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "パスワードが必須であること(passwordが空では登録できない)" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "パスワードは、6文字以上での入力が必須であること(passwordが5文字以下であれば登録できない)" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "パスワードは、半角英数字混合での入力が必須であること" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "パスワードは、半角英数字混合での入力が必須であること" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end


      it "パスワードとパスワード（確認用）、値の一致が必須であること(passwordが存在してもpassword_confirmationが空では登録できない)" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "誕生日が空だと登録できない" do
      @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
       end

    end
  end
end