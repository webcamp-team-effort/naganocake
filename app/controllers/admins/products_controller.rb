class Admins::ProductsController < ApplicationController
	def new
		@product = Product.new
	end
	def index
		@products = Product.all
		@products = Product.page(params[:page]).per(10)
	end
	def show
		@product = Product.find(params[:id])
		a = @product.tax_included_price.to_f
		b = 1.1.to_f
		@tax_included = "#{a*b}".to_i
	end
	def edit
		@product = Product.find(params[:id])
	end
	def create
		@product = Product.new(product_params)
		@product.save
		redirect_to admins_products_path
	end
	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
		redirect_to admins_products_path
	end


private
	def product_params
	params.require(:product).permit(:genre_id, :name, :explanation, :tax_included_price, :image, :on_sale)
	end
end

