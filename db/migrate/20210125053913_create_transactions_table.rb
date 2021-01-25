class CreateTransactionsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :title
      t.float :amount
      t.datetime :time
      t.references :asset, index: true
    end
  end
end
