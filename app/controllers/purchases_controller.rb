class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_product, only: [:index, :create]
  def index
    @purchase_address = PurchaseAddress.new
    return unless @item.user_id == current_user.id || !@item.purchase.nil?

    redirect_to root_path
  end

  def create

  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name,
                                             :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_params
    params.require(:item).permit(:name, :price, :shipping_fee_status_id, :image, :user_id)
  end



  def set_item
    @item = Item.find(params[:item_id])
  end
end