class DosesController < ApplicationController
  before_action :set_recipe

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.amount /= 100
    @dose.recipe = @recipe

    if @dose.save
      redirect_to new_recipe_dose_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to new_recipe_dose_path(@recipe)
  end

  private

  def dose_params
    params.require(:dose).permit(:amount, :description, :ingredient_id)
  end

  def set_recipe
    @recipe = Recipe.last
  end
end
