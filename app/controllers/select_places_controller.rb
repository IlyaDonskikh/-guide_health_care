class SelectPlacesController < ApplicationController
  def new
  end

  def create
    @search_result = search_result_params
  end

  private

    def search_result_params
      params.permit(:address)
    end
end
