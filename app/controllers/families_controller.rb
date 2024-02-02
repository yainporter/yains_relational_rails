class FamiliesController < ApplicationController
  def index
    @families = Family.sort_by_creation
  end

  def show
    @family = Family.find(params[:id])
  end

  def new

  end

  def create
    family = Family.create(family_params)
    family.save

    redirect_to families_path
  end

  def edit
    @family = Family.find(params[:id])
  end

  def update
    family = Family.find(params[:id])
    family.update(family_params)

    redirect_to families_show_path(params[:id])
  end

  private

  def family_params
    params.permit(:name)
  end
end
