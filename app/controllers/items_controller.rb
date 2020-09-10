class ItemsController < ApplicationController
  # before_action :authenticate_user!

  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
       redirect_to action: :index
    else
       render "new"
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :category_id, :prefecture_id,
                                 :product_condition_id, :postage_payer_id, :preparation_days_id).merge(user_id: current_user.id)
  end

end

