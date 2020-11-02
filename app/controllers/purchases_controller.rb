class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_furima, only: [:index, :create]

  
  def index
    @purchase = PurchaseForm.new
   
    if current_user.id == @furima.user_id || @furima.purchase.present?
       redirect_to root_path  
    end
  end


  def create
    @purchase = PurchaseForm.new(purchase_params)
    if@purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :city, :municipality, :building_name, :phone_number).merge(user_id: current_user.id, furima_id: @furima.id, token: params[:token])
  end

  def set_furima
    @furima = Furima.find(params[:furima_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_5281a7815c10499a90a34a4d"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @furima.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

end