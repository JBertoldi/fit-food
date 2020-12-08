class DosesController < ApplicationController
  before_action :set_recipe

  def new
    @new_recipe = Recipe.new
    @dose = Dose.new
  end
   
  def update
    @dose = Dose.find(params[:id])

    if @dose.update(dose_params_update)
      redirect_to new_recipe_dose_path(@recipe)
    else
      redirect_to new_recipe_dose_path(@recipe), notice: 'OH NÃOOOOOOOOOOOO :O'
    end
  end

  def create
    @dose = Dose.new(dose_params)
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

  def dose_params_update
    params.require(:dose).permit(:amount, :description)
  end

  def set_recipe
    @recipe = Recipe.last
  end
end
