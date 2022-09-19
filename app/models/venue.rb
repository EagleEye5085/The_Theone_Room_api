class Venue < ApplicationRecord
  geocoded_by :address,
    latitude: :fetched_latitude,
    longitude: :fetched_longitude
  reverse_geocoded_by :latitude, :longitude
end