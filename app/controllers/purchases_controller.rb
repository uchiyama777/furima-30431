class PurchasesController < ApplicationController
  before_action :authenticate_user!
  def index
    @purchase = Purchase.find(params[:id])
    if current_user == @purchase.user
      redirect_to root_path  
    end
  end
end
