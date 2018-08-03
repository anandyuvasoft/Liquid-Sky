class CreateLocationDiseases < ActiveRecord::Migration[5.1]
  def change
    create_table :location_diseases do |t|
      t.references :location, foreign_key: true
      t.references :disease, foreign_key: true

      t.timestamps
    end
  end
end
