class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:edit, :update, :show ,:destroy]
  before_action :set_items, only: [:edit,:update, :destroy]
  

  
  def index
    @items = Item.all.order(id: "DESC" )
  end
  

  def new
    @item = Item.new
  end


  def show
    
  end

  def edit
  
  end


  def destroy
    @item.destroy
    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  
  

  private

  def item_params
    params.require(:item).permit(:name, :info, :price, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id,
                                    :scheduled_delivery_id, :image).merge(user_id: current_user.id)
  end


  def set_item
    @item = Item.find(params[:id])
  end

  def set_items
    unless @item.user == current_user
      redirect_to action: :index
    end
  end



end
