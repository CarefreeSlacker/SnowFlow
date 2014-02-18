class PositionController < ApplicationController

  private
  def user_params
    params.require(:position).permit(:cart_id, :item_id, :quantity)
  end
end
