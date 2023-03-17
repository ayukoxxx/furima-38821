class ProductsController < ApplicationController
  def index
    @user = User.new
    @products = Product.order("created_at DESC")
  end
end
