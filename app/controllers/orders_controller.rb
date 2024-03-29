class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]

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

  def order_params
    params.require(:order_address).permit(:postcode, :area_id, :municipality, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,        
      card: order_params[:token], 
      currency: 'jpy'             
    )
  end

  def non_purchased_item
    @product = Product.find(params[:product_id])
    redirect_to root_path if current_user.id == @product.user_id || @product.order.present?
  end
end
