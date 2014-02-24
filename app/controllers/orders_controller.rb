class OrdersController < ApplicationController
  #layouts
  layout 'layouts/order.html.erb'

  #before filters
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :signed_filter
  before_action :admin_filter, only: [:index,:edit,:update,  :destroy]
  before_action :true_user , only: [:show]

  # GET /orders
  # GET /orders.json
  def index
    params[:page] ||= 1
    if params[:status]
      if params[:status] == 'done'
        @orders = Order.where(done: true).paginate(page: params[:page],per_page: 10)
      else
        @orders = Order.where(done: false).paginate(page: params[:page],per_page: 10)
      end
    else
      @orders = Order.paginate(page: params[:page],per_page: 10)
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @cart = @order.cart
  end

  # GET /orders/new
  def new
    order_cart = Cart.find(params[:cart_id].to_i)
    @order = Order.new(cart_id: order_cart.id , user_id: order_cart.user.id, done: false)
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params, done: false)
    respond_to do |format|
      if @order.save
        format.html do
          cart = current_cart
          cart.update_attributes(checkouted: true, order_id: @order.id) #refreshing the cart
          current_cart = Cart.create(user_id:current_user.id )
          OrderMailer.order_formed(@order).deliver
          redirect_to @order, notice: 'Order was successfully created.'
          end
        format.json do
          cart = current_cart
          cart.update_attributes(checkouted: true, order_id: @order.id) #refreshing the cart
          OrderMailer.order_formed(@order).deliver
          render action: 'show', status: :created, location: @order
          end
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:cart_id, :user_id, :country, :region, :city , :post_code, :lane, :home, :appartament, :floor, :personal_payment, :shipped, :done )
    end

    def true_user
      if @order.user == current_user || current_user.admin?
        true
      else
        render 'shared/error_303'
      end
    end
end
