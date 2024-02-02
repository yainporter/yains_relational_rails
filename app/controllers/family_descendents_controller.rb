class FamilyDescendentsController < ApplicationController
  def index
    @family_descendents = Family.find(params[:id]).descendents
  end

  def new

  end

  def create
    family = Family.find(params[:id])
    family.descendents.create(family_descendents_params)

    redirect_to family_descendents_path(family)
  end

  private

  def family_descendents_params
    params.permit(:first_name, :family_id, :parents_id, :female, :languages_spoken)
  end
end
