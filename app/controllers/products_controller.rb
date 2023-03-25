class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :product_find, except:[:index,:create,:new]

  def index
    @products = Product.includes(:user).order("created_at DESC")
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

  def show
    
  end

  def edit

    redirect_to root_path unless current_user == @product.user
  end

  def update
    if @product.update(product_params)
    redirect_to  product_path(@product.id)
    else
      @product.update(product_params)
    render 'edit'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name,:introduction,:price,:image,:shipping_cost_id,:condition_id,:area_id,:ship_date_id,:category_id).merge(user_id: current_user.id)
  end

  def product_find
    @product = Product.find(params[:id])
  end

end
