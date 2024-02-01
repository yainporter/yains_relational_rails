class ChildrenController < ApplicationController
  def index
    @children = Child.all
  end

  def show
    @child = Child.find(params[:id])
  end

  private

  def child_params
    params.require(:child).permit(:first_name, :surname_id, :female, :languages_spoken_id)
  end
end
