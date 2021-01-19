module RecipeHelper
  def author?
    current_user.id == @recipe.user_id
  end

  def favourited?
    current_user.favourited?(@recipe)
  end
end
