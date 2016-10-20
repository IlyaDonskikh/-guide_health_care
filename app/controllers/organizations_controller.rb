class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.includes(:illnesses)
                                  .order(name: :asc)
                                  .page(params[:page]).per(15)
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
