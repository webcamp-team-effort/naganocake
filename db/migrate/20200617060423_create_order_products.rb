class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :price,      null: false, default: ""
      t.integer :quantity,   null: false, default: ""
      t.integer :status,     null: false, default: "0"
      t.integer :order_id,   null: false, default: ""
      t.integer :product_id, null: false, default: ""

      t.timestamps
    end

    add_index :order_products, :order_id
  end
end
