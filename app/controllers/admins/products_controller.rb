class Admins::ProductsController < ApplicationController
	  before_action :authenticate_admin!
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
		if @product.save
		   redirect_to admins_product_path(@product)
	    else
	  	render "new"
	    end
	end
	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
		   redirect_to admins_products_path
		else
	  	   render "edit"
	    end
	end
	 def search
    # application controllerで生成した@qを利用して検索する
    @q_products = @q.result.page(params[:page]).per(10)
    render :index
  	end

 
private
	def product_params
	params.require(:product).permit(:genre_id, :name, :explanation, :tax_included_price, :image, :on_sale)
	end
end

