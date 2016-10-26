class OrganizationAge < ApplicationRecord
  ## Relations
  belongs_to :organization

  ## Validates
  validates :min, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: :max }
  validates :max, numericality: { less_than_or_equal_to: 100 }, presence: true
end
