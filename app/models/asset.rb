class Asset < ApplicationRecord
  belongs_to :user

  validates :category, acceptance: { accept: ['stock', 'real_estate', 'bank', 'cash', 'etc']}
end