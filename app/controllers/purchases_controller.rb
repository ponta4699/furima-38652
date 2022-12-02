class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  
  def index
    @purchase_address = PurchaseAddress.new
    return unless @item.user_id == current_user.id || !@item.purchase.nil?

    redirect_to root_path
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
    

  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name,
                                             :phone_number).merge(user_id: current_user.id, item_id: params[:item_id] )
  end

  def item_params
    params.require(:item).permit(:name, :price, :shipping_fee_status_id, :image, :user_id)
  end



  def set_item
    @item = Item.find(params[:item_id])
  end
end