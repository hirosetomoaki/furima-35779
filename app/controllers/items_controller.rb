class ItemsController < ApplicationController
  def index
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

  private

  def item_params
    params.require(:item).permit(:product, :product_description, :category_id, :product_status_id, :price, :state_id,
                                 :freight_id, :due_date_id, :image).merge(user_id: current_user.id)
  end
end
