class OrdersController < ApplicationController
  def index
  
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def order_params
    params.require(:order_address).permit(:postcode, :area, :municipality, :house_number, :building_name, :price, :telephone_number).merge(user_id: current_user.id,product_id: params[:product_id])
  end
end
