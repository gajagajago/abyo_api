class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :title, :amount, :time, :asset_category

  def asset_category
    object.asset.category
  end
end
