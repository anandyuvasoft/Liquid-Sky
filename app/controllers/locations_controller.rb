class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def import
    file_import = Location.import(params[:file])
    if file_import[:success]
      flash[:notice] = file_import[:message]
    else
      flash[:error] = file_import[:message]
    end
    redirect_to locations_path
  end

end
