class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)

    if @item.order.present? || @item.user_id == current_user.id
      redirect_to root_path
    end

  end

  def create
   @item = Item.find(params[:item_id])
   @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:postal_code, :prefectures_id,:municipality, :address, :building, :phone_number, :item_id).merge(user_id: current_user.id)
  end
end
