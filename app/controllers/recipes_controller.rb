class RecipesController < ApplicationController

  def index
    @recipes = Recipe.order(name: :asc)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.name = @recipe.name.capitalize
    @recipe.user = current_user

    if @recipe.save
      redirect_to new_recipe_dose_path(@recipe)
    else
      render :new, notice: 'Something went wrong, please check if all the fields are correctly filled.'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :instructions)
  end
end
