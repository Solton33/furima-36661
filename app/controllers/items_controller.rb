class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.order(created_at: :desc)
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

  def show
  end

  def edit
    if @item.user_id != current_user.id || @item.order.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end


  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
   def item_params
    params.require(:item).permit(:image, :item_name, :price, :item_text, :category_id, :status_id, :delivery_fee_id, :prefectures_id, :shipping_date_id).merge(user_id: current_user.id)
   end

   def set_item
    @item = Item.find(params[:id])
   end


end
