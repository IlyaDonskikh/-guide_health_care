class CreateOrganizationIllnesses < ActiveRecord::Migration[5.0]
  def change
    create_table :organization_illnesses do |t|
      t.integer :organization_id
      t.integer :illness_id

      t.timestamps
    end
  end
end
