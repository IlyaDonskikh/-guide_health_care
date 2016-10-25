class SelectPlacesController < ApplicationController
  def new
  end

  def create
    @search_result = search_result_params
    @address = Geocoder.address(@search_result[:coords])
  end

  private

    def search_result_params
      params.permit(:coords)
    end
end
