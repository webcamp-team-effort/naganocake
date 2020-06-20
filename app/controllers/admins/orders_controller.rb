class Admins::OrdersController < ApplicationController
  # 注文履歴一覧を表示（管理者用）
  def index
    # 新しい順に表示するページ分けにする
    # config/initializers/kaminari_config.rb に config.default_per_page = 10 を記述する（コンフリクト確認してから）
    @orders = Order.page(params[:page]).reverse_order
  end

  # 注文履歴詳細画面（管理者用）
  def show
    @order = Order.find(params[:id])
  end

  # 注文ステータスの更新
  def update
    @order = Order.find(params[:id])
  end

  private
  # ストロングパラメータ要確認
  def order_params
    params.require(:order).permit(:status)
  end

end
