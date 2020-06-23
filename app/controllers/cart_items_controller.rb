class CartItemsController < ApplicationController
	def index
	@cart_items = current_customer.cart_items.all
	end
	def create
	@cart_item = current_customer.cart_items.new(cart_item_params)
	@cart_item_find = current_customer.cart_items.find_by(product_id: @cart_item.product_id)
    if @cart_item_find
       #@cart_item_find.quantity += @cart_item.quantity
	   @cart_item_find.update(quantity: @cart_item_find.quantity + @cart_item.quantity)
	else
		@cart_item.save
    end
    	redirect_to cart_items_path
	end
	def update
		@cart_item = CartItem.find(params[:id])
		@cart_item.update(cart_item_params)
		redirect_to cart_items_path
	end
	def destroy
		@cart_item = CartItem.find(params[:id])
		@cart_item.destroy
		redirect_to cart_items_path
	end
	def empty
		@cart_items = current_customer.cart_items.all
		@cart_items.delete_all
		redirect_to cart_items_path
	end



private
	def cart_item_params
	params.require(:cart_item).permit(:quantity, :customer_id, :product_id)
	end
end
