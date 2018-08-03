# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# Rooms
puts '####### Importing Locations ######'

#Room.destroy_all
Location.import((File.open(File.join(Rails.root, 'locations.csv')) ) )



diseases = ["Cancer", "Malaria", "Dengue", "Tuberculosis", "Asthma", "Hepatitis-B"]

diseases.each do |name|
  Disease.where(name:name).first_or_create! do |disease|
    disease.name = name
  end
end

Location.all.each do |location|
  Disease.where(name:["Cancer", "Malaria"]).all.each do |disease|
    LocationDisease.create(location_id:location.id,disease_id:disease.id)
  end
end