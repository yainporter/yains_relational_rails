class Family::DescendentsController < ApplicationController
  def index
    @descendents = index_filter(params)
  end

  private

  def index_filter(params)
    if params[:filter]
      Descendent.sort_alphabetically(params[:id])
    elsif params[:sort_by]
      Descendent.threshold_filter(params[:id], params[:sort_by])
    elsif params[:sort_by_languages]
      Descendent.number_of_languages(params[:id], params[:sort_by_languages])
    else
      Descendent.family_descendents(params[:id])
    end
  end
end
