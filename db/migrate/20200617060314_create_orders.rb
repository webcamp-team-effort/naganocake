class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id,    null: false, default: ""
      t.integer :postage,        null: false, default: "800"
      t.integer :total_price,    null: false, default: ""
      t.integer :payment_method, null: false, default: "0"
      t.string :send_postcode,   null: false, default: ""
      t.string :send_address,    null: false, default: ""
      t.string :send_name,       null: false, default: ""
      t.integer :status,         null: false, default: "0"


      t.timestamps
    end
  end
end
