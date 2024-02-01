class FamiliesController < ApplicationController
  def index
    @families = Family.all
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

  private

  def family_params
    params.permit(:name)
  end
end
