class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_recipe, except: %i[index create]

  def index
    if params[:search]
      @recipes = Recipe.search params[:search], match: :word_middle
    else
      @recipes = Recipe.published.ordered
    end
  end

  def show; end

  def publish
    if @recipe.publish
      redirect_to recipe_path(@recipe), notice: 'Recipe published successfully!'
    else
      redirect_to recipe_path(@recipe), notice: 'Please fill all the fields in order to publish.'
    end
  end

  def unpublish
    if @recipe.unpublish
      redirect_to recipe_path(@recipe), notice: 'Recipe unpublished successfully'
    else
      redirect_to recipe_path(@recipe), notice: 'There was an unnexpected error. Please try again later'
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to new_recipe_dose_path(@recipe)
    else
      render 'pages/profile'
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

  def destroy
    if @recipe.destroy
      redirect_to profile_path, notice: 'Recipe deleted successfully'
    else
      render recipe_path(@recipe), notice: 'Something went wrong. Please try again later'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :difficulty, :photo, :instructions, :preparation_time, :cooking_time)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
