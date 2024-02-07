class FamiliesController < ApplicationController
  def index
    @families = index_filter
  end

  def show
    @family = Family.find(params[:id])
  end

  def new

  end

  def create
    family = Family.create(family_params)
    if family.save
      redirect_to families_path
    else
      flash[:notice] = "Family not created: Please fill out Family Name"
      render :new
    end
  end

  def edit

  end

  def update
    family = Family.find(params[:id])
    if family.update(family_params)
      redirect_to families_show_path(params[:id])
    else
      flash[:notice] = "Family not updated: Please fill out Family Name"
      render :edit
    end
  end

  def destroy
    family = Family.find(params[:id])
    family.destroy

    redirect_to families_path
  end

  private

  def family_params
    params.permit(:name)
  end

  def index_filter
    if params[:sort]
      @families = Family.sort_by_number_of_descendents
    elsif params[:keyword]
      @families = Family.keyword_search(params[:keyword])
    elsif params[:partial_match]
      @families = Family.partial_match(params[:partial_match])
    else
      @families = Family.sort_by_creation
    end
  end
end
