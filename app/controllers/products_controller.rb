class ProductsController < ApplicationController
  def top
    @genres = Genre.all
	@products = Product.where(on_sale: true).page(params[:page]).per(4)
	@product_all = Product.all
  end

  def index
  @genres = Genre.all
	@products = Product.where(on_sale: true).page(params[:page]).per(8)
	@product_all = Product.all
  end

  def show
  	@genres = Genre.all
  	@product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

end
