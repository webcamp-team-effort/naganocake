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
  	a = @product.tax_included_price.to_f
  	b = 1.1.to_f
  	@tax_included = "#{a*b}".to_i
    @cart_item = CartItem.new
  end

end
