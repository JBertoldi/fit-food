class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_recipe, only: %i[show edit update]

  def index
    @recipes = Recipe.order(name: :asc)
  end

  def show; end

  def create
    @recipe = Recipe.new(recipe_params_create)
    @recipe.user = current_user

    if @recipe.save
      redirect_to new_recipe_dose_path(@recipe)
    else
      render 'pages/profile'
    end
  end

  def edit; end

  def update
    if @recipe.update(recipe_params_update)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  private

  def recipe_params_create
    params.require(:recipe).permit(:name, :photo)
  end

  def recipe_params_update
    params.require(:recipe).permit(:name, :difficulty, :photo, :instructions, :preparation_time, :cooking_time)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
