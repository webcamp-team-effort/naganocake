class OrdersController < ApplicationController
  # 注文完了画面(Viewのみ)
  def finish
  end

  # 注文確認画面
  def confirm
    @order = Order.find(params[:id])
    @customer = current_customer
    @delivery = @customer.delivery
    @order.postage = 800
    if params[:order_send_info] == 0
      @order.send_postcode = @customer.postcode
      @order.send_address = @customer.address
      @order.send_name = @customer.name
    elsif params[:order_send_info] == 1
      @order.send_postcode = @delivery.postcode
      @order.send_address = @delivery.address
      @order.send_name = @delivery.name
    elsif params[:order_send_info] == 2
      @order.send_postcode = params[:postcode]
      @order.send_address = params[:send_address]
      @order.send_name = params[:send_name]
    end
  end

  # 注文履歴一覧（顧客自身の）
  # where（与えられた条件にマッチするレコードをすべて返す）
  def index
    @orders = Order.where(customer_id:current_customer)
    @order_prodoucts = @order.order_products
  end

  # 注文履歴詳細
  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end

  # 新規注文画面（支払先・配送情報画面）
  def new
    @customer = current_customer
    @deliveries = current_customer.deliveries
    @delivery = Delivery.new
    @order = Order.new
    @order.customer_id = current_customer.id
  end

  # 新規注文の作成(ここでorder_productsも作成)
  def create
    @customer = Customer.find(current_customer.id)
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_products = @order.order_prodoucts.new
      @order_products.product_id = cart_item.product_id
      @order_products.product.name = cart_item.product.name
      @order_products.price = cart_item.product.tax_include_price
      @order_products.quantity = cart_item.quantity
      @order_products.save
      current_customer.cart_items.destroy_all
    end
    redirect_to orders_finish_path
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postage, :total_price, :payment_method, :send_postcode, :send_address, :send_name, :status)
  end
end
