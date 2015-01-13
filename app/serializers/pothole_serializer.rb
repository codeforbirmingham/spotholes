class PotholeSerializer < ActiveModel::Serializer
  attributes :id, :name, :longitude, :latitude, :status, :score, :thumb_url
  has_one :user, serializer: ShortUserSerializer

  def thumb_url
    object.image.url(:"#{options[:density]}")
  end
end
