module Panel
  class OrganizationsController < ApplicationController
    before_action :set_resource, except: [:index, :new, :create]
    before_action :set_form_resources, except: [:index, :destroy]

    def index
      @organizations = Organization.order(name: :asc).page(params[:page]).per(15)
    end

    def new
      @organization = Organization.new
    end

    def create
      @organization = Organization.new(organization_params)
      if @organization.save
        redirect_to panel_organizations_path, notice: t('.success')
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @organization.update(organization_params)
        redirect_to panel_organizations_path, notice: t('.success')
      else
        render :edit
      end
    end

    def destroy
      @organization.destroy
      redirect_to panel_organizations_path
    end

    private

      def set_resource
        @organization = Organization.find(params[:id])
      end

      def set_form_resources
        @illnesses = Illness.order(name: :asc)
      end

      def organization_params
        params.require(:organization).permit(
          :name, :description, :address,
          organization_illnesses_attributes: [:id, :illness_id, :_destroy]
        )
      end
  end
end
