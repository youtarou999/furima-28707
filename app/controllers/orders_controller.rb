class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @item = Item.find(params[:id])
    @order = OrderDestination.new
  end

  def create
    @order = Order.new(price: order_params[:price])
  #   @order = OrderDestination.create(order_params)
  #   if @order.save
  #     redirect_to action: :index
  #  else
  #     render "new"
  #  end
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def orfer_params
    params.require(:order_destination).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, ).merge(user_id: current_user.id, item_id:current_item.id )
  end

  private

  def order_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = "sk_test_6018ccc339c56ee8142b22c7"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
