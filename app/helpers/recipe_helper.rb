module RecipeHelper
  def author?
    current_user.id == @recipe.user_id
  end
end
