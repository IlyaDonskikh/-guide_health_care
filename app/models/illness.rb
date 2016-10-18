class Illness < ApplicationRecord
  ## Relations
  belongs_to :illness, required: false
  has_many :illnesses
  has_many :organization_illnesses, dependent: :destroy
  has_many :organizations, through: :organization_illnesses

  ## Validates
  validates :name, presence: true, uniqueness: true
end
