class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :gender
      t.string :address
      t.datetime :date_of_birth
      t.string :zipcode

      t.timestamps
    end
  end
end
