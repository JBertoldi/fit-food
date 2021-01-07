class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @recipe = Recipe.new
    @favourites = Recipe.favourited_by(current_user.username)
  end
end
