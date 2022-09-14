class Review < ApplicationRecord

  belongs_to :users
  belongs_to :throne_rooms

end
