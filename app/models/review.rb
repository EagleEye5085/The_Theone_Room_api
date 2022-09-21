require 'pry'
class Review < ApplicationRecord

  validates_presence_of :cleanliness
  validates_presence_of :ambiance
  validates_presence_of :tp_quality
  validates_presence_of :privacy
  validates_presence_of :other_comments
  validates_presence_of :throne_room_id
  validates_presence_of :user_id

  # belongs_to :user
  belongs_to :throne_room

end
