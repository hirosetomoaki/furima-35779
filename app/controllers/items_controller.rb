class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:edit,:update, :destroy]
  before_action :buy_params, only: [:edit, :update, :destroy]
  
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:product, :product_description, :category_id, :product_status_id, :price, :state_id,
                                 :freight_id, :due_date_id, images: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_user
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def buy_params 
    if @item.buy.present?
      redirect_to root_path 
    end
  end
end

