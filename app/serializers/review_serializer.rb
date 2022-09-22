class ReviewSerializer
  include JSONAPI::Serializer
  attributes :cleanliness, :ambiance, :tp_quality, :privacy, :accessibility, :other_comments, :throne_room_id, :user_id
end