module Panel
  class IllnessesController < ApplicationController
    before_action :set_resource, except: [:index, :new, :create]
    before_action :set_form_resources, except: [:index, :destroy]

    def index
      @illnesses = Illness.order(name: :asc).page(params[:page]).per(15)
    end

    def new
      @illness = Illness.new
    end

    def create
      @illness = Illness.new(illness_params)
      if @illness.save
        redirect_to panel_illnesses_path, notice: t('.success')
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @illness.update(illness_params)
        redirect_to panel_illnesses_path, notice: t('.success')
      else
        render :edit
      end
    end

    def destroy
      @illness.destroy

      redirect_to panel_illnesses_path, notice: t('.success')
    end

    private

      def set_resource
        @illness = Illness.find(params[:id])
      end

      def set_form_resources
        @illnesses = Illness.order(name: :asc).where.not(id: params[:id])
      end

      def illness_params
        params.require(:illness).permit(
          :name, :description, :illness_id
        )
      end
  end
end
