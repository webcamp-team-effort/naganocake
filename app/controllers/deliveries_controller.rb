class DeliveriesController < ApplicationController
  # 配送先一覧＋登録画面
  def index
    @delivery = Delivery.new
    @deliveries = current_customer.deliveries
  end

  # 配送先登録
  def create
    @custmoer = Customer.find(current_customer.id)
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
  end

  # 配送先編集画面（一覧画面に編集ボタンあり）
  def edit
    @delivery = Delivery.find(params[:id])
  end

  # 配送先更新（編集画面にて更新）
  def update
    @delivery = Delivery.find(params[:id])
    @delivery.update(delivery_params)
    redirect_to deliveries_path
  end

  # 配送先削除（一覧画面に削除ボタンあり）
  def destroy
    delivery = Delivery.find(params[:id])
    delivery.destroy
    redirect_to user_path
  end

  private
  def delivery_params
    params.require(:delivery).permit(:customer_id, :postcode, :address, :name)
  end
end
