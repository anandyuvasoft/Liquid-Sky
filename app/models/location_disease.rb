class LocationDisease < ApplicationRecord
  belongs_to :location
  belongs_to :disease
end
