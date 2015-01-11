class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :score, :api_key
end
