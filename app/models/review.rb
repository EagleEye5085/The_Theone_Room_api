require 'pry'
class Review < ApplicationRecord
  validates :cleanliness, presence: true, numericality: true
  validates :ambiance, presence: true, numericality: true
  validates :tp_quality, presence: true, numericality: true
  validates :privacy, presence: true, numericality: true
  validates :accessibility, presence: true, numericality: true
  validates_presence_of :other_comments
  validates_presence_of :throne_room_id
  validates_presence_of :user_id

  # belongs_to :user
  belongs_to :throne_room

  after_validation :average_rating

  def average_rating
    if self.overall_rating == nil
      self.update(overall_rating: (self.cleanliness.to_f + self.ambiance.to_f + self.tp_quality.to_f + self.privacy.to_f + self.accessibility.to_f)/5)
    end
  end


end
