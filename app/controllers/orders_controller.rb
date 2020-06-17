class OrdersController < ApplicationController
  # 注文確認画面
  def confirm
    
  end

  # 注文完了画面
  def finish
    
  end

  # 注文履歴一覧（お客様単位）
  def index
    
  end

  # 注文履歴詳細
  def show
    
  end

  # 新規注文画面（支払先・配送情報画面）
  def new

  end

  # 新規注文の作成
  def create

  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postage, :total_price, :payment_method, :send_postcode, :send_address, :send_name, :status)
  end
end
