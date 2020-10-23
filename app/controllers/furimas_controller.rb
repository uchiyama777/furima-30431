class FurimasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :new]

  def index
  end

  def new
    @furimas = Furima.order("created_at DESC")
    @furima = Furima.new
  end

  def create
    @furimas = Furima.new(furimas_params)
    if @furimas.save
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
  params.require(:furimas).permit(:content, :image, :title, :text, :category_id, :status_id, :delivery_charge_id, :prefectures_id, :delivery_day_id).merge(user_id: current_user.id)
  end
end