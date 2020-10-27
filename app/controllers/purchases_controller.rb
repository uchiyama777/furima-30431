class PurchasesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @furima = Furima.find(params[:furima_id])
    if current_user == @furima.user
      redirect_to root_path  
    end
  end
end
