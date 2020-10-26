class FurimasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @furimas = Furima.all.order("created_at DESC")
  end

  def new
    @furima = Furima.new
  end

  def create
    @furima = Furima.new(furimas_params)
    if @furima.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @furima = Furima.find(params[:id])
  end

  def edit
  end

  def destroy
  end

  def update
  end


 private

  def furimas_params
    params.require(:furima).permit(:image, :name, :description, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :delivery_day_id).merge(user_id: current_user.id)
  end
end