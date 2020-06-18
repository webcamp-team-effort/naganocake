class OrdersController < ApplicationController
  # 注文確認画面
  def confirm
    
  end

  # 注文完了画面(Viewのみ)
  def finish
  end

  # 注文履歴一覧（お客様自身の）
  def index
    
  end

  # 注文履歴詳細
  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end

  # 新規注文画面（支払先・配送情報画面）
  def new
    @order = Order.new
    @order.customer_id = current_customer.id
  end

  # 新規注文の作成
  def create
    @customer = Customer.find(current_customer.id)
    @order = Order.new(order_params)
    @book.user_id = current_user.id
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postage, :total_price, :payment_method, :send_postcode, :send_address, :send_name, :status)
  end
end
