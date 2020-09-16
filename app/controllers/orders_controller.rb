class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new()
  end

  def new
    @item = Item.find(params[:id])
  end

  def create
    @order = OrderDestination.new(order_params)

    # if @order.valid?
    #   pay_item
    #   @order.save
    #   return redirect_to root_path
    # else
    #   render 'new'
    # end

  end

  private

  def order_params
    params.require(:order_destination).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end
 
end
