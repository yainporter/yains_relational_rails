class Families::DescendentsController < ApplicationController
  def index
    @descendents = index_filter(params)
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

  def index_filter(params)
    if params[:filter]
      Descendent.sort_alphabetically(params[:id])
    else
      Descendent.family_descendents(params[:id])
    end
  end
end
