class PotholeSerializer < ActiveModel::Serializer
  attributes :id, :name, :longitude, :latitude, :status, :score

end
