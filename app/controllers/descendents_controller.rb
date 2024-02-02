class DescendentsController < ApplicationController
  def index
    @descendents = Descendent.true_records
  end

  def show
    @descendent = Descendent.find(params[:id])
  end

  def edit
    @descendent = Descendent.find(params[:id])
  end

  def update
    descendent = Descendent.find(params[:id])
    descendent.update(descendent_params)

    redirect_to descendents_show_path(descendent)
  end

  private

  def descendent_params
    params.permit(:first_name, :family_id, :parents_id, :female, :languages_spoken)
  end
end
