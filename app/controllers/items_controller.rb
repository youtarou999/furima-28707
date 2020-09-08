class ItemsController < ApplicationController
  # before_action :authenticate_user!

  def index
  end
  
  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :category_id, :product_condition_id, :postage_payer_id, :preparation_days_id).merge(user_id: current_user.id)
  end

end

