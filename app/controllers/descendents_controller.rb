class DescendentsController < ApplicationController
  def index
    if params[:id].present?
      @descendents = Family.find(params[:id]).descendents
    else
      @descendents = Descendent.all
    end
  end

  def show
    @descendent = Descendent.find(params[:id])
  end
end
