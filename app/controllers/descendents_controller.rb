class DescendentsController < ApplicationController
  def index
    @descendents = Descendent.all
  end

  def show
    @descendent = Descendent.find(params[:id])
  end

  private

  def descendent_params
    params.require(:descendent).permit(:first_name, :family_id, :female, :languages_spoken_id)
  end
end
