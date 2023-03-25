class PurchaseRecordsController < ApplicationController

  def index
    @product = Product.find(params[:id])
  end

end
