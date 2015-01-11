class PotholeSerializer < ActiveModel::Serializer
  attributes :id, :name, :longitude, :latitude, :status, :score
  has_one :user, serializer: ShortUserSerializer
end
