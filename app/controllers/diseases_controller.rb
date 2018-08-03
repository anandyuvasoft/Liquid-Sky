class DiseasesController < ApplicationController

  def index
    @diseases = Disease.all
  end

  def import
    file_import = Disease.import(params[:file])
    if file_import[:success]
      flash[:notice] = file_import[:message]
    else
      flash[:error] = file_import[:message]
    end
    redirect_to diseases_path
  end

end
