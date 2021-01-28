class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :title, :amount, :time

  belongs_to :asset

  class AssetSerializer < ActiveModel::Serializer
    attributes :id, :category
  end
end
