class AverageSerializer
  include JSONAPI::Serializer
  attributes :cleanliness, :ambiance, :tp_quality, :privacy, :accessibility, :id
end