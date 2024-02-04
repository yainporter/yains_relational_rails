class DescendentsController < ApplicationController
  def index
    @descendents = index_filter
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

  def destroy
    descendent = Descendent.find(params[:id])
    descendent.destroy

    redirect_to descendents_path
  end

  private

  def descendent_params
    params.permit(:first_name, :family_id, :parents_id, :female, :languages_spoken)
  end

  def index_filter
    if params[:keyword]
      @descendents = Descendent.descendents_keyword_search(params[:keyword])
    else
      @descendents = Descendent.true_records
    end
  end
end
