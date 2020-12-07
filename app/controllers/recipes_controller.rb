class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show update]
  def index
    @recipes = Recipe.order(name: :asc)
  end

  def show
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

  def update
    if @recipe.update(recipe_params)
      redirect_to profile_path # Change after
    else
      redirect_to new_recipe_dose_path(@recipe)
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :instructions)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
