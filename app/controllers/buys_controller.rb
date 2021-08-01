class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_params, only: [:index, :create]
  before_action :user_params, only: [:index, :create]
 

  def index
    @buyaddress = BuyAddress.new
  end

  def create
    @buyaddress = BuyAddress.new(buy_params)
    if @buyaddress.valid?
       pay_item
       @buyaddress.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:postal_code, :state_id, :city, :street, :building_name, :phone).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def item_params
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: item_params[:price],
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def user_params
    if current_user.id == @item.user.id || @item.buy.present?
      redirect_to root_path
    end
  end


end
