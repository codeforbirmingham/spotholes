class PotholeSerializer < ActiveModel::Serializer
  attributes :id, :name, :longitude, :latitude, :status, :score, :image_url, :thumb_url
  has_many :pothole_logs
  has_one :user, serializer: ShortUserSerializer

  def image_url
    object.image.url
  end

  def thumb_url
    object.image.url(:"#{options[:density]}")
  end
end
