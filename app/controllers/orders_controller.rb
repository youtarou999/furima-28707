class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :set_order, only: [:index, :create]

  def index
  end

  def new
    @item = Item.find(params[:id])
  end

  def create
    
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end

  end

  private

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token, :authenticity_token, :order_destination, :item_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_6018ccc339c56ee8142b22c7"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_order
    @order = OrderDestination.new(order_params)
  end

end
