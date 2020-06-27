class Admins::OrderProductsController < ApplicationController
  def update
    @order_product = OrderProduct.find(params[:id])
    @order_product.update(order_product_params)
    case @order_product.status
    when "製作中"
      @order_product.order.update(status: "製作中")
    when "製作完了"
      if @order_product.order.order_products.all?{|order_product| order_product.status == "製作完了"}
        @order_product.order.update(status: "発送準備中")
      end
    end
    redirect_to admins_order_path(@order_product.order.id)
  end

  private
  def order_product_params
    params.require(:order_product).permit(:status)
  end
end
