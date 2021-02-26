class CreateCartItem < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.references :cart, index: true
      t.references :product, index: true
      t.integer :product_count
    end
  end
end
