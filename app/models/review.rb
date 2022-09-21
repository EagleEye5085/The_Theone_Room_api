require 'pry'
class Review < ApplicationRecord
  validates :cleanliness, presence: true, numericality: true
  validates :ambiance, presence: true, numericality: true
  validates :tp_quality, presence: true, numericality: true
  validates :privacy, presence: true, numericality: true
  validates_presence_of :other_comments
  validates_presence_of :throne_room_id
  validates_presence_of :user_id

  # belongs_to :user
  belongs_to :throne_room

end
