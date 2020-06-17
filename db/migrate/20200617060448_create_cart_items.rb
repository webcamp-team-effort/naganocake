class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :quantity,    null: false, default: ""
      t.integer :customer_id, null: false, default: ""
      t.integer :product_id,  null: false, default: ""

      t.timestamps
    end

    add_index :cart_items, :customer_id
  end
end
