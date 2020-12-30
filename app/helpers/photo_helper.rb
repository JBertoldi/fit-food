module PhotoHelper
  def user_photo(user)
    user.photo.present? ? user.photo.key : 'user_placeholder'
  end

  def recipe_photo(recipe)
    recipe.photo.present? ? recipe.photo.key : 'waffles'
  end
end
