class ThroneRoom < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :directions
  # validates_presence_of :baby_changing_station
  validates_presence_of :bathroom_style
  # validates_presence_of :key_code_required


  has_many :reviews

end
