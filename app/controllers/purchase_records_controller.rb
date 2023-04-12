class PurchaseRecordsController < ApplicationController

  def index
    @products = Product.new
  end

  def new
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postcode, :area, :municipality, :address, :building_name, :price, :telephone_number).merge(user_id: current_user.id)
  end

end




