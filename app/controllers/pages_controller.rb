class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @recipe = Recipe.new
    @recipes = current_user.recipes
    @favourites = Recipe.favourited_by(current_user.username)
  end
end
