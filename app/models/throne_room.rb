class ThroneRoom < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :directions
  validates_presence_of :baby_changing_station
  validates_presence_of :bathroom_style
  validates_presence_of :key_code_required

  enum baby_changing_station: { "false": 0, "true": 1 }, _prefix: :baby_changing_station
  enum bathroom_style: { "gender-neutral": 0, "multi-stall F": 1, "multi-stall M": 2, "single seater F": 3, "single seater M": 4, "porta-potty": 5}, _prefix: :bathroom_style
  enum key_code_required: { "false": 0, "true": 1 }, _prefix: :key_code_required


  has_many :reviews


  geocoded_by :address

  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def review_averages
    reviews.pluck('avg(cleanliness), avg(ambiance), avg(tp_quality), avg(privacy)').flatten
  end

end
