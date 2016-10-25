class SelectIllnessesController < ApplicationController
  def new
    @illnesses = Illness.order(name: :asc)
    @illness_groups = @illnesses.group_by { |g| g.name.first }
  end

  def create
    @search_result = search_result_params
    @illness = Illness.find(@search_result[:illness_id])
  end

  private

    def search_result_params
      params.permit(:illness_id)
    end
end
