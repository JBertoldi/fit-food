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

    if @recipe.save
      redirect_to recipe_path(@recipe), notice: 'Recipe created successfuly!'
    else
      render :new, notice: 'Something went wrong, please check if all the fields are filled correctly.'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :kcal, :carbs, :saturated_fats, :unsaturated_fats, :protein, :salt)
  end
end
