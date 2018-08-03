class Disease < ApplicationRecord

  has_many :location_diseases
  has_many :locations, through:  :location_diseases

  class << self

    def import(file)
      file_import = {}
      case(File.extname(file.original_filename))
      when '.csv'
        CSV.foreach(file.path, headers: true) do |row|
          begin
            disease  = Disease.new(row.to_hash)
          rescue ActiveModel::UnknownAttributeError
            file_import[:message], file_import[:success] = "Wrong File", false
            return file_import
          end

          if disease.valid?
            disease.save
            file_import[:message], file_import[:success] = "diseases has been successfully imported", true
          else
            file_import[:message], file_import[:success] = "#{disease.errors.full_messages.first}", false
          end
        end
      else
        file_import[:message], file_import[:success] = "Only .csv file format supported", false
      end
      return file_import
    end
  end


end
