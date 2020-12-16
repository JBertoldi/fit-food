class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update]

  def index
    @recipes = Recipe.order(name: :asc)
  end

  def show; end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to new_recipe_dose_path(@recipe)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
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
