class AddStockCodeToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :stock_code, :string
  end
end
