class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_furima, only: [:index, :create]

  
  def index
    @purchase = PurchaseForm.new
   
    if current_user == @furima.user
       redirect_to root_path  
    end
  end


  def create
    @purchase = PurchaseForm.new(purchase_params)
    if@purchase.valid?
      @purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase_form).permit(:price,  :postal_code, :prefecture_id, :city, :municipality, :building_name, :phone_number).merge(user_id: current_user.id, furima_id: @furima.id)
  end

  def set_furima
    @furima = Furima.find(params[:furima_id])
  end

end
