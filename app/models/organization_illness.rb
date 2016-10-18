class OrganizationIllness < ApplicationRecord
  ## Relations
  belongs_to :organization
  belongs_to :illness
end
