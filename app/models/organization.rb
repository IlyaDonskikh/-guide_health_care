class Organization < ApplicationRecord
  geocoded_by :address

  ## Relations
  has_many :organization_illnesses, dependent: :destroy
  has_many :illnesses, through: :organization_illnesses

  accepts_nested_attributes_for :organization_illnesses, allow_destroy: true

  ## Scopes
  scope :filter_address, -> (address) { near(address) }
  scope :filter_illness, -> (illness_id) { where(illnesses: { id: illness_id }) }

  ## Validates
  validates :name, presence: true, uniqueness: true

  ## Callbacks
  after_validation :geocode

end
