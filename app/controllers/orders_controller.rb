class OrdersController < ApplicationController
  def index
  end

  def new
    @order = OrderDestination.new
  end

  def create
    @order = OrderDestination.create(order_params)
    if @order.save
      redirect_to action: :index
   else
      render "new"
   end
  end

  private

  def orfer_params
    params.require(:order_destination).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, ).merge(user_id: current_user.id, item_id:current_item.id )
  end
end
