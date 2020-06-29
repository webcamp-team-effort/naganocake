class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id,           null: false, default: ""
      t.string :name,                null: false, default: ""
      t.text :explanation,           null: false, default: ""
      t.integer :tax_included_price, null: false, default: ""
      t.string :image_id,            null: false, default: ""
      t.boolean :on_sale,            null: false, default: "true"

      t.timestamps
    end
  end
end
