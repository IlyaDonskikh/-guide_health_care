class Organization < ApplicationRecord
  geocoded_by :address

  ## Relations
  has_many :organization_illnesses, dependent: :destroy
  has_many :illnesses, through: :organization_illnesses
  has_many :ages, dependent: :destroy, class_name: 'OrganizationAge'

  accepts_nested_attributes_for :organization_illnesses, allow_destroy: true
  accepts_nested_attributes_for :ages, reject_if: :all_blank, allow_destroy: true

  ## Scopes
  scope :filter_address, -> (address) { near(address) }
  scope :filter_illness, -> (illness_id) { where(illnesses: { id: illness_id }) }

  ## Validates
  validates :name, presence: true, uniqueness: true

  ## Callbacks
  after_validation :geocode, if: :address_changed?

end
