class DosesController < ApplicationController
  before_action :set_recipe
  before_action :set_recipe_macros, only: :new

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

  def update
    @dose = Dose.find(params[:id])

    if @dose.update(dose_params_update)
      redirect_to new_recipe_dose_path(@recipe)
    else
      redirect_to new_recipe_dose_path(@recipe), notice: 'Something went wrong, please check if all the fields are filled correctly'
    end
  end

  # Updating still not in place

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

  def set_recipe_macros
    @recipe_macros = {
      kcal: 0,
      carbs: 0,
      fats: 0,
      'sat fats' => 0,
      protein: 0,
      salt: 0
    }

    @recipe.doses.each do |dose|
      @recipe_macros[:kcal] += dose.ingredient.kcal * dose.amount
      @recipe_macros[:carbs] += dose.ingredient.carbs * dose.amount
      @recipe_macros[:fats] += dose.ingredient.total_fats * dose.amount
      @recipe_macros['sat fats'] += dose.ingredient.saturated_fats * dose.amount
      @recipe_macros[:protein] += dose.ingredient.protein * dose.amount
      @recipe_macros[:salt] += dose.ingredient.salt * dose.amount
    end
  end
  # Check how to refactor this code
end
