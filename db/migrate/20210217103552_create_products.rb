class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :image_url
      t.references :user, index: true
    end
  end
end
