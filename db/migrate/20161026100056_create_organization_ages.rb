class CreateOrganizationAges < ActiveRecord::Migration[5.0]
  def change
    create_table :organization_ages do |t|
      t.integer :organization_id
      t.integer :min
      t.integer :max

      t.timestamps
    end
  end
end
