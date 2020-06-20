class Admins::ProductsController < ApplicationController
	def new
		@product = Product.new
	end
	def index
		@products = Product.all
		@products = Product.page(params[:page]).per(10)
	end
	def show
		
	end
	def edit
		
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

