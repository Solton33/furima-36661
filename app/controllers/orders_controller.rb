class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new

    if @item.order.present? || @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def create
   @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:postal_code, :prefectures_id,:municipality, :address, :building, :phone_number, :item_id).merge(user_id: current_user.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end

end
