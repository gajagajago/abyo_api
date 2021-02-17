class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :price, :image_url, :is_favorite

  def is_favorite
    object.favorites.exists?(user: current_user)
  end
end
