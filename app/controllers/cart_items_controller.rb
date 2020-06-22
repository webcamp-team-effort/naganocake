class CartItemsController < ApplicationController
	before_action :setup_cart_item!, only: [:create, :update, :delete]

	def index
		@cart_items = CartItem.where(customer_id: current_customer.id).all
	end
	def create
	if @cart_item.blank?
      @cart_item = current_customer.cart_items.build(product_id: params[:product_id])
    end
    @cart_item.save
    redirect_to cart_items_path
	end
	def update
		
	end
	def destroy
		
	end
	def empty
		
	end

private
	def cart_item_params
	params.require(:cart_item).permit(:quantity)
	end
  def setup_cart_item!
    @cart_item = current_customer.cart_items.find_by(product_id: params[:product_id])
  end


end
