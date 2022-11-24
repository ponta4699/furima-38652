class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  


  def new
    @item = Item.new
  end

  private

  def product_params
    params.require(:item).permit(:name, :info, :price, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id,
                                    :scheduled_delivery_id, :image).merge(user_id: current_user.id)
  end



  redirect_to action: :index

end
