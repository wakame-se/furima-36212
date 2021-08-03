class ItemsController < ApplicationController
  before_action :item_find, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :ensure_correct_user, except: [:index, :show]

  def index
    @items = Item.includes(:user).order(created_at: :DESC)
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
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_find
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :delivery_fee_id, :prefecture_id,
                                 :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def ensure_correct_user
    redirect_to root_path unless @item.user_id == current_user.id
  end

end
