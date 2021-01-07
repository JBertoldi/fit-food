class FavouritesController < ApplicationController
  before_action :set_recipe

  def create
    @favourite = Favourite.new(user: current_user, recipe: @recipe)

    if @favourite.save
      redirect_to recipe_path(@recipe)
    else
      render recipe_path(@recipe), notice: 'There was an unexpected error. We apoligize for the inconvenience'
    end
  end

  def destroy
    @favourite = current_user.favourites.find_by(recipe: @recipe)
    @favourite.destroy

    redirect_to recipe_path(@recipe)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
