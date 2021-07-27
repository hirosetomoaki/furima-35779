class BuysController < ApplicationController

  def index
    @buyaddress = BuyAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buyaddress = BuyAddress.new(buy_params)
    if @buyaddress.valid?
       @buyaddress.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:postal_code, :state_id, :city, :street, :building_name, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
