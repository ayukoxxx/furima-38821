class ProductsController < ApplicationController
  before_action :move_to_signUp, except: [:index, :show]

  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def product_params
    params.require(:product).permit(:name,:introduction,:price,:image,:shipping_cost_id,:condition_id,:area_id,:ship_date_id,:category_id).merge(user_id: current_user.id)
  end

  def move_to_signUp
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end


end
