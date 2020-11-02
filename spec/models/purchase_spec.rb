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

  it "都道府県が空では登録できないこと" do
    @purchase.prefecture_id = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
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

  it "phone_numberが空では登録できないこと" do
    @purchase.token = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Token can't be blank")
  end
end