class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :price, :image_url, :is_favorite, :favorite

  def is_favorite
    object.favorites.exists?(user: current_user)
  end

  def favorite
    object.favorites.find_by(user: current_user)
  end
end
