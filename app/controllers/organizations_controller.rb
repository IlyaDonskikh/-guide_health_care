class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.includes(:illnesses)
    @address_coords = filter_params[:address] if filter_params[:address]
    apply_filter
  end

  private

    def filter_params
      params.permit(:address, :illness)
    end

    def apply_filter
      filter_params.each do |key, value|
        @organizations = @organizations.public_send "filter_#{key}", value if value.present?
      end
    end
end
