require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

    describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
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


      it "パスワードとパスワード（確認用）、値の一致が必須であること(passwordが存在してもpassword_confirmationが空では登録できない)" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

    end
  end
end