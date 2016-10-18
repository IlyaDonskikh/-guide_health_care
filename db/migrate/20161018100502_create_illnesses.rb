class CreateIllnesses < ActiveRecord::Migration[5.0]
  def change
    create_table :illnesses do |t|
      t.string :name
      t.text :description
      t.integer :illness_id

      t.timestamps
    end
  end
end
