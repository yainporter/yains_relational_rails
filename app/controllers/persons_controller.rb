class PersonsController < ApplicationController
  def index
    @persons = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :surname_id, :female, :languages_spoken_id)
  end
end
