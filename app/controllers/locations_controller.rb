class LocationsController < ApplicationController
  # before_action :set_location, only: [:show, :edit, :update, :destroy]
  respond_to :json

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)
    @location.save
    respond_with(@location)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:zip_code, :street, :lat_long, :latitude, :longitude, :gmaps)
    end
end
