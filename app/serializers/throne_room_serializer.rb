class ThroneRoomSerializer
  include JSONAPI::Serializer

  attributes :name, :address, :latitude, :longitude, :directions, :baby_changing_station, :bathroom_style, :key_code_required

end
