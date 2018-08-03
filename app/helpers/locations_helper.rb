module LocationsHelper

  def get_diseases(location)
    location.diseases.map(&:name).join(', ')
  end

end
