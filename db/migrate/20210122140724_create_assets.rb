class CreateAssets < ActiveRecord::Migration[6.0]
  def change
    create_table :assets do |t|
      t.string :category
      t.float :amount
      t.references :user, index: true
    end
  end
end
