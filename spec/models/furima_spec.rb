require 'rails_helper'

RSpec.describe Furima, type: :model do
  describe '#create' do
    before do
      @furima = FactoryBot.build(:furima)
    end

    it '必須項目全て入力されていたら、登録ができる' do
      expect(@furima).to be_valid
      # binding.pry
    end

    it '商品画像を1枚つけることが必須であること' do
      @furima.image = nil
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が必須であること' do
      @furima.name = nil
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が必須であること' do
      @furima.description = nil
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーの情報が必須であること' do
      @furima.category_id = nil
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Category can't be blank", "Category is not a number")
    end

    it 'カテゴリーの情報に1が入ると登録できない' do
      @furima.category_id = 1
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Category must be other than 1")
    end

    it '商品の状態についての情報が必須であること' do
      @furima.status_id = nil
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Status can't be blank", "Status is not a number")
    end

    it '商品の状態についての情報に1が入ると登録できない' do
      @furima.status_id = 1
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Status must be other than 1")
    end

    it '配送料の負担についての情報が必須であること' do
      @furima.delivery_charge_id = nil
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Delivery charge can't be blank", "Delivery charge is not a number")
    end

    it '配送料の負担についての情報に1が入ると登録できない' do
      @furima.delivery_charge_id = 1
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Delivery charge must be other than 1")
    end

    it '発送元の地域についての情報が必須であること' do
      @furima.prefecture_id = nil
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
    end

    it '発送元の地域についての情報に1が入ると登録できない' do
      @furima.prefecture_id = 1
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it '発送までの日数についての情報が必須であること' do
      @furima.delivery_day_id = nil
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Delivery day can't be blank", "Delivery day is not a number")
    end

    it '発送までの日数についての情報に1が入ると登録できない' do
      @furima.delivery_day_id = 1
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Delivery day must be other than 1")
    end

    it '価格についての情報が必須であること' do
      @furima.price = nil
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Price can't be blank")
    end

    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @furima.price = 10,000,000
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Price can't be blank", "Price is not a number", "Price is not a number")
    end

    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @furima.price = 200
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it '販売価格は半角数字のみ保存可能であること' do
      @furima.price = "９９９９９"
      @furima.valid?
      expect(@furima.errors.full_messages).to include("Price is not a number", "Price is not a number")
    end

    

  end
end
