class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products, dependent: :destroy


  # enum：１つのカラムに指定した複数個の定数を保存できる様にする
  enum payment_method: { "クレジットカード": 0, "銀行振込": 1 }
  enum status: { "入金待ち": 0, "入金確認": 1, "制作中": 2, "発送準備中": 3, "発送済み": 4 }

  # 合計金額（商品合計）の計算
  def calculation(customer)
    products_price = 0
    customer.cart_items.each do |cart_item|
      products_price += cart_item.product.tax_included_price * cart_item.quantity
    end
    return (products_price * 1.1).floor
  end
end
