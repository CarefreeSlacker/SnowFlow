class CartsController < ApplicationController
  #filters
  before_filter :set_cart, only: [:edit, :update]
  before_filter :signed_filter



  #actions
  def checkout
    redirect_to "/orders/new?cart_id=#{current_cart.id}"
  end

  def remove_position
    # :position_id - passed from carts/edit
    Position.find(params[:position_id].to_i).destroy
    redirect_to :back
  end

  def add_to_cart
    #variables initialisation
    good = Item.where(good_id: params[:item_id].to_i ,good_type: params[:item_type]).first #searching for item
    good_included = false
    position_id = nil

    #searching for before adding
    current_cart.positions.map do |elem|
      if elem.item_id == good.id #if item allready included it remembers it's position id.
        good_included = true
        position_id = elem.id
        break
      end
    end

    #adding for position
    if good_included #if item included -  |1| if not - |2|
      position = Position.find(position_id)
      old_quantity = position.quantity
      position.update_attributes(quantity: old_quantity + params[:quantity].to_i) #|1| - then increment it's quantity
    else
      Position.create(cart_id: current_cart.id ,item_id: good.id, quantity: params[:quantity]) #|2| - create new position
    end

    redirect_to :back

  end

  def edit
  end

  def update
    unless params[:position][0].empty? #unless any position included in cart
      params[:position][0].each do |key , value|
        Position.find(key.to_i).update_attributes(quantity: value.to_i) #searching according position and changes it's quantity
      end
    end
    flash[:success] = "Positions has successfully changed"
    redirect_to edit_cart_path
  end

  private
    def cart_params
      params.require(:cart).permit(:positions[]) #positions[] - means that positions may be array
    end

    def set_cart
      @cart = Cart.find(params[:id]) #initializing for cart
    end

end
