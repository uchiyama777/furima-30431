class FurimasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, ]

  def index
  end

  def new
    @furimas = Furima.order("created_at DESC")
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

  def destroy
  end

  def update
  end


 private

  def furimas_params
    params.require(:furima).permit(:content, :image, :title, :text, :name, :parameters, :description, :price, :category_id, :status_id, :delivery_charge_id, :prefectures_id, :delivery_day_id).merge(user_id: current_user.id)
  end
end