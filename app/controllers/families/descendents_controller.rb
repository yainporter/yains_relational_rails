class Families::DescendentsController < ApplicationController
  def index
    @family_descendents = Family.find(params[:id]).descendents
  end

  def new

  end

  def create
    descendent = Descendent.new(descendent_params)
    descendent.save

    redirect_to family_descendents_path(params[:id])
  end

  private

  def descendent_params
    params.permit(:first_name, :family_id, :female, :languages_spoken)
  end
end
