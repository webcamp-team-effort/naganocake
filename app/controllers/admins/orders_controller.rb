class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show, :update]

  # 注文履歴一覧を表示（管理者用）
  def index
    # 新しい順に表示するページ分けにする
    @orders = Order.page(params[:page]).per(10).reverse_order
  end

  # 注文履歴詳細画面（管理者用）
  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end

  # 注文ステータス・制作ステータスの更新
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "入金確認"
      @order.order_products.each do |order_product|
      order_product.update(status: "製作待ち")
      end
    end
    redirect_to admins_order_path(@order)
  end

  private
  # ストロングパラメータ要確認
  def order_params
    params.require(:order).permit(:status)
  end

end
