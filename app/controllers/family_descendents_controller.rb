class FamilyDescendentsController < ApplicationController
  def index
    @family_descendents = Family.find(params[:id])
  end
end
