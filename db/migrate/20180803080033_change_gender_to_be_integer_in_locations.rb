class ChangeGenderToBeIntegerInLocations < ActiveRecord::Migration[5.1]
  def change
      change_column :locations, :gender, 'integer USING CAST(gender AS integer)'
  end
end
