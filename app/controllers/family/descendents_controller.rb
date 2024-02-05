class Family::DescendentsController < ApplicationController
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
    elsif params[:sort_by]
      Descendent.threshold_filter(params[:id], params[:sort_by])
    else
      Descendent.family_descendents(params[:id])
    end
  end
end
