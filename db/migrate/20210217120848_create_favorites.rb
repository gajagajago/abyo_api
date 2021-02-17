class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :user, index: true
      t.references :product, index: true
    end
  end
end
