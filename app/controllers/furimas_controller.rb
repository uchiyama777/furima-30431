class FurimasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_furima, except: [:index, :new, :create]

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

  def destroy
    if current_user == @furima.user
    @furima.destroy
    redirect_to root_path
    else
    render :show
    end
  end

  def show
  end

  def edit
    unless current_user == @furima.user
      redirect_to root_path
    end
  end


  def update
    if @furima.update(furimas_params)
      redirect_to furima_path
    else
      render :edit
    end
  end


 private

  def furimas_params
    params.require(:furima).permit(:image, :name, :description, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :delivery_day_id).merge(user_id: current_user.id)
  end
end

  def set_furima
    @furima = Furima.find(params[:id])
  end