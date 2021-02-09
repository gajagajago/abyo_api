class Asset < ApplicationRecord
  CATEGORIES = ['credit', 'stock', 'bitcoin', 'bank', 'cash', 'etc']

  belongs_to :user
  has_many :transactions

  validates :category, acceptance: { accept: CATEGORIES }

  def self.init_user_assets(user)
    CATEGORIES.each { |c| Asset.create(category: c, amount: 0, user: user) }
  end

  def self.update_amount(transaction)
    @asset = Asset.find(transaction.asset_id)
    @asset.update_attribute(:amount, @asset.amount + transaction.amount)
  end

  def self.update_stock_amount(asset_id, amount)
    @asset = Asset.find(asset_id)
    @asset.update_attribute(:amount, amount)
  end
end