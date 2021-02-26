class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :assets, dependent: :destroy
  has_many :transactions, through: :assets
  has_many :products, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def generate_new_authentication_token
    token = User.generate_unique_secure_token
    update_attribute(:authentication_token, token)
  end
end
