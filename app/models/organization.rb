class Organization < ApplicationRecord
  geocoded_by :address

  ## Validates
  validates :name, presence: true, uniqueness: true

  ## Callbacks
  after_validation :geocode
end
