class DosesController < ApplicationController
  before_action :set_recipe

  def create
    @dose = Dose.new(dose_params)
    @dose.recipe = @recipe

    if @dose.save
      redirect_to recipe_path(@recipe), notice: 'Ingredient added'
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to recipe_path(@recipe)
  end

  private

  def dose_params
    params.require(:dose).permit(:amount, :description, :ingredient_id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
