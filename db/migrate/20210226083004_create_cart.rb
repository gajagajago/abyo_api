class CreateCart < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.references :user, index: true
    end
  end
end
