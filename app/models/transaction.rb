class Transaction < ApplicationRecord
  validates_presence_of :asset_id, :title, :amount, :time

  belongs_to :asset
end
