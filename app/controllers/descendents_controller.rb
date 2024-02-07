class DescendentsController < ApplicationController
  def index
    @descendents = index_filter
  end

  def new
    
  end

  def create
    descendent = Descendent.new(descendent_params)
    if descendent.save
      redirect_to family_descendents_path(params[:id])
    else
      flash[:notice] = "Descendent not created: Please fill out all fields"
      render :new
    end
  end

  def show
    @descendent = Descendent.find(params[:id])
  end

  def edit
    @descendent = Descendent.find(params[:id])
  end

  def update
    @descendent = Descendent.find(params[:id])
    if @descendent.update(descendent_params)
      redirect_to descendents_show_path(@descendent)
    else
      @descendent = Descendent.find(params[:id])
      flash[:notice] = "Descendent not updated: Please fill out all fields to update"
      render :edit
    end
  end

  def destroy
    descendent = Descendent.find(params[:id])
    descendent.destroy

    redirect_to descendents_path
  end

  private

  def descendent_params
    params.permit(:first_name,
                  :family_id,
                  :parents_id,
                  :female,
                  :languages_spoken)
  end

  def index_filter
    if params[:keyword]
      @descendents = Descendent.descendents_keyword_search(params[:keyword])
    elsif params[:partial_match]
      @descendents = Descendent.descendents_partial_match(params[:partial_match])
    elsif params[:filter]
      @descendents = Descendent.all
    else
      @descendents = Descendent.true_records
    end
  end
end
