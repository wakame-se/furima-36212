class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find
  before_action :move_to_index

  def index
    @order_address = OrderAddress.new
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
  def item_find
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def move_to_index
    redirect_to root_path if @item.order.present? || @item.user_id == current_user.id
  end

  def pay_item
    Payjp.api_key = "sk_test_115efd7b436ba12500dddb50"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
