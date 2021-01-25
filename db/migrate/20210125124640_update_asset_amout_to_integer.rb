class UpdateAssetAmoutToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :assets, :amount, :integer
    change_column :transactions, :amount, :integer
  end
end
