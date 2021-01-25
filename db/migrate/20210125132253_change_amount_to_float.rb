class ChangeAmountToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :assets, :amount, :float
    change_column :transactions, :amount, :float
  end
end
