class Location < ApplicationRecord

  enum gender: ['Male', 'Female']

  geocoded_by :address

  after_validation :geocode


  has_many :location_diseases
  has_many :diseases, through:  :location_diseases

 accepts_nested_attributes_for :diseases, allow_destroy: true
  class << self

    def import(file)
      file_import = {}
      file_format = file.class == ActionDispatch::Http::UploadedFile ? File.extname(file.original_filename) : file.to_path
      case(file_format.split(".").last)
      when 'csv'
        CSV.foreach(file.path, headers: true) do |row|
          begin
            location  = Location.new(row.to_hash)
          rescue ActiveModel::UnknownAttributeError
            file_import[:message], file_import[:success] = "Wrong File", false
            return file_import
          end

          if location.valid?
            location.save
            file_import[:message], file_import[:success] = "Locations has been successfully imported", true
          else
            file_import[:message], file_import[:success] = "#{location.errors.full_messages.first}", false
          end
        end
      else
        file_import[:message], file_import[:success] = "Only .csv file format supported", false
      end
      return file_import
    end
  end


end
