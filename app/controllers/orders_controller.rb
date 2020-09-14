class OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
    if @order.save
      redirect_to action: :index
   else
      render "new"
   end
  end

  private

  def orfer_params
    params.require(:order).merge(user_id: current_user.id, item_id:current_item.id )
  end
end
