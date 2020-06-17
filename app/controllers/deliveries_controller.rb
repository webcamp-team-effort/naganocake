class DeliveriesController < ApplicationController
  # 配送先一覧＋登録画面
  def index
    
  end

  # 配送先登録
  def create
    
  end

  # 配送先編集画面（一覧画面に編集ボタンあり）
  def edit
    
  end

  # 配送先更新（編集画面にて更新）
  def update
    
  end

  # 配送先削除（一覧画面に削除ボタンあり）
  def destroy
    
  end

  private
  def delivery_params
    params.require(:delivery).permit(:customer_id, :postcode, :address, :name)
  end
end
