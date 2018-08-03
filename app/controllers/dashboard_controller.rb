class DashboardController < ApplicationController
  skip_before_action :authenticate_user!

  def main
    @locations = Location.all
    @locations = @locations.where(gender:params[:gender]) if params[:gender].present?
    @locations = @locations.joins(:diseases).where("diseases.name ILIKE ?", "%#{params[:disease]}%") if params[:disease].present?
    @locations = @locations.near(params[:address], 10) if params[:address].present?
  end

end
