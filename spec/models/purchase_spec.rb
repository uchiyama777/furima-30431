require 'rails_helper'


RSpec.describe PurchaseForm, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase_form)
  end

  it "すべての必須な項目の情報が入力されていれば登録できる" do
    expect(@purchase).to be_valid
  end

  it "tokenが空では登録できないこと" do
    @purchase.token = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Token can't be blank")
  end

  it "郵便番号が空では登録できないこと" do
    @purchase.postal_code = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include( "Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
  end

  it "郵便番号にハイフンがない場合は登録できないこと" do
    @purchase.postal_code = "1234567"
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
  end

  it "都道府県が空では登録できないこと" do
    @purchase.prefecture_id = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
  end

  it "都道府県のIDが1の時は登録できないこと" do
    @purchase.prefecture_id = 1
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Prefecture must be other than 1")
  end

  it "市区町村が空では登録できないこと" do
    @purchase.city = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("City can't be blank")
  end

  it "番地が空では登録できないこと" do
    @purchase.municipality = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Municipality can't be blank")
  end

  it "電話番号が空では登録できないこと" do
    @purchase.token = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Token can't be blank")
  end

  it "電話番号が12桁以上では登録できないこと" do
    @purchase.phone_number = "100000000000"
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Phone number must be less than or equal to 99999999999")
  end

  it "電話番号がハイフンが入ると登録できないこと" do
    @purchase.phone_number = "090-1234-5678"
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Phone number is invalid", "Phone number is not a number")
  end

end